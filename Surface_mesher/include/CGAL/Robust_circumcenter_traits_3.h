// Copyright (c) 2005-2007  INRIA Sophia-Antipolis (France).
// All rights reserved.
//
// This file is part of CGAL (www.cgal.org); you may redistribute it under
// the terms of the Q Public License version 1.0.
// See the file LICENSE.QPL distributed with CGAL.
//
// Licensees holding a valid commercial license may use this file in
// accordance with the commercial license agreement provided with the software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
//
// $URL$
// $Id$
//
//
// Author(s)     :  Mariette Yvinec <Mariette.Yvinec@sophia.inria.fr>
//                  Laurent Rineau <Laurent.Rineau@sophia.inria.fr>

// This traits override Construct_circumcenter_3
// to get a robust ones when called on slivers

#ifndef CGAL_ROBUST_CIRCUMCENTER_TRAITS_3_H
#define CGAL_ROBUST_CIRCUMCENTER_TRAITS_3_H

#include <CGAL/number_utils_classes.h>
#include <CGAL/Cartesian_converter.h>
#include <CGAL/Robust_construction.h>
#include <CGAL/Exact_predicates_exact_constructions_kernel.h>
#include <CGAL/Regular_triangulation_euclidean_traits_3.h>

CGAL_BEGIN_NAMESPACE

template < typename K >
class Robust_construct_weighted_circumcenter_3
{
public:
  typedef Exact_predicates_exact_constructions_kernel EK2;
  typedef Regular_triangulation_euclidean_traits_3<EK2> EK;

  typedef typename K::Weighted_point_3               Weighted_point_3;
  typedef typename K::Bare_point                     Bare_point;
  typedef typename K::FT                             FT;

  typedef Bare_point       result_type;

  typedef Weighted_converter_3<Cartesian_converter<typename K::Kernel,EK2> >
    To_exact;
  typedef Weighted_converter_3<Cartesian_converter<EK2,
						   typename K::Kernel,
						   To_double<EK::FT> > >
    Back_from_exact;
  

  Bare_point operator() ( const Weighted_point_3 & p,
			  const Weighted_point_3 & q,
			  const Weighted_point_3 & r,
			  const Weighted_point_3 & s) const
  {
    To_exact to_exact;
    Back_from_exact back_from_exact;
    EK::Construct_weighted_circumcenter_3
      exact_weighted_circumcenter = EK().construct_weighted_circumcenter_3_object();

    return back_from_exact(exact_weighted_circumcenter(to_exact(p),
						       to_exact(q),
						       to_exact(r),
						       to_exact(s)));
  }

  Bare_point operator() ( const Weighted_point_3 & p,
			  const Weighted_point_3 & q,
			  const Weighted_point_3 & r) const
  {
    To_exact to_exact;
    Back_from_exact back_from_exact;
    EK::Construct_weighted_circumcenter_3
      exact_weighted_circumcenter = EK().construct_weighted_circumcenter_3_object();

    return back_from_exact(exact_weighted_circumcenter(to_exact(p),
						       to_exact(q),
						       to_exact(r)));
  }

  Bare_point operator() ( const Weighted_point_3 & p,
			  const Weighted_point_3 & q) const
  {
    To_exact to_exact;
    Back_from_exact Back_from_exact;
    EK::Construct_weighted_circumcenter_3
      exact_weighted_circumcenter = EK().construct_weighted_circumcenter_3_object();

    return back_from_exact(exact_weighted_circumcenter(to_exact(p),
						       to_exact(q)));
  }
};

template < class K>
class Robust_circumcenter_traits_3
  : public K
{
  typedef Exact_predicates_exact_constructions_kernel EK;
 public:
  typedef CGAL::Robust_construction<EK::Construct_circumcenter_3,
	                            Cartesian_converter<K, EK>,
				    Cartesian_converter<EK, K, To_double<EK::FT> >,
				    typename K::Point_3 >   Construct_circumcenter_3;
  typedef CGAL::Robust_construction<EK::Compute_squared_radius_3,
	                            Cartesian_converter<K, EK>,
				    Cartesian_converter<EK, K, To_double<EK::FT> >,
				    typename K::FT >   Compute_squared_radius_3;

  Construct_circumcenter_3
  construct_circumcenter_3_object() const
  { return Construct_circumcenter_3(); }

  Compute_squared_radius_3
  compute_squared_radius_3_object() const
  { return Compute_squared_radius_3(); }
};

template < class K>
class Robust_weighted_circumcenter_traits_3
  : public K
{
 public:
  typedef CGAL::Robust_construct_circumcenter_3<typename K::Kernel> Construct_circumcenter_3;
  typedef CGAL::Robust_squared_radius_3<K> Compute_squared_radius_3;

  Construct_circumcenter_3
  construct_circumcenter_3_object() const
  { return Construct_circumcenter_3(); }

  typedef CGAL::Robust_construct_weighted_circumcenter_3<K> Construct_weighted_circumcenter_3;

  Construct_weighted_circumcenter_3
  construct_weighted_circumcenter_3_object() const
  { return Construct_weighted_circumcenter_3(); }

  Compute_squared_radius_3
  compute_squared_radius_3_object() const
  { return Compute_squared_radius_3(); }
};

CGAL_END_NAMESPACE

#endif //CGAL_ROBUST_CIRCUMCENTER_TRAITS_3_H
