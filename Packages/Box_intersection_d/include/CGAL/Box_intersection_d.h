#ifndef CGAL_BOX_INTERSECTION_D_H
#define CGAL_BOX_INTERSECTION_D_H

#include <CGAL/Box_intersection_d/segment_tree.h>
#include <CGAL/Box_intersection_d/box_traits.h>
#include <CGAL/Box_intersection_d/box_limits.h>

CGAL_BEGIN_NAMESPACE


template< class RandomAccessIter, class Callback >
void box_intersection_d( RandomAccessIter p_begin, RandomAccessIter p_end,
                         RandomAccessIter i_begin, RandomAccessIter i_end,
                         Callback& callback,
                         unsigned int cutoff = 10,
                         Box_intersection_d::Setting  setting  = Box_intersection_d::BIPARTITE,
                         Box_intersection_d::Topology topology = Box_intersection_d::CLOSED )
{
    typedef typename RandomAccessIter::value_type Box_type;
    typedef Default_box_traits_d< Box_type > Box_traits;

    box_intersection_d(p_begin, p_end, i_begin, i_end,
                       callback, Box_traits(), cutoff, setting);
}

template< class RandomAccessIter, class Callback, class BoxTraits >
void box_intersection_d(RandomAccessIter p_begin, RandomAccessIter p_end,
                        RandomAccessIter i_begin, RandomAccessIter i_end,
                        Callback& callback,
                        BoxTraits box_traits,
                        unsigned int cutoff = 10,
                        Box_intersection_d::Setting  setting  = Box_intersection_d::BIPARTITE,
                        Box_intersection_d::Topology topology = Box_intersection_d::CLOSED)
{
    if (topology == Box_intersection_d::CLOSED ) {
        typedef Default_box_predicate_traits_d< BoxTraits, true > Traits;
        box_intersection_d_custom(p_begin, p_end, i_begin, i_end, callback, Traits(), cutoff, setting);
    } else {
        typedef Default_box_predicate_traits_d< BoxTraits, false > Traits;
        box_intersection_d_custom(p_begin, p_end, i_begin, i_end, callback, Traits(), cutoff, setting);
    }
}

template< class RandomAccessIter, class Callback, class BoxPredicateTraits >
void box_intersection_d_custom(
      RandomAccessIter p_begin, RandomAccessIter p_end,
      RandomAccessIter i_begin, RandomAccessIter i_end,
      Callback& callback,
      BoxPredicateTraits traits,
      unsigned int cutoff = 10,
      Box_intersection_d::Setting setting = Box_intersection_d::BIPARTITE
      //typename BoxPredicateTraits::Interval_Spanning_Predicate p = typename BoxPredicateTraits::Interval_Spanning_Predicate()
                       )
{
    typedef BoxPredicateTraits Traits;
    typedef typename Traits::NT NT;
    const unsigned int dim = Traits::get_dim() - 1;
    const NT inf = box_limits<NT>::inf();
    const NT sup = box_limits<NT>::sup();

    segment_tree(p_begin, p_end, i_begin, i_end,
                 inf, sup, callback, traits, cutoff, dim, true);
    if(setting == Box_intersection_d::BIPARTITE)
        segment_tree(i_begin, i_end, p_begin, p_end,
                      inf, sup, callback, traits, cutoff, dim, false);
}

CGAL_END_NAMESPACE


#endif
