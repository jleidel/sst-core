// Copyright 2009-2010 Sandia Corporation. Under the terms
// of Contract DE-AC04-94AL85000 with Sandia Corporation, the U.S.
// Government retains certain rights in this software.
// 
// Copyright (c) 2009-2010, Sandia Corporation
// All rights reserved.
// 
// This file is part of the SST software package. For license
// information, see the LICENSE file in the top level directory of the
// distribution.



#ifndef _SST_SST_H
#define _SST_SST_H

#include <sst_stdint.h>

namespace SST {

typedef unsigned long   ComponentId_t;
 typedef unsigned long   LinkID_t;
typedef uint64_t  Cycle_t;
typedef uint64_t  SimTime_t;
typedef double          Time_t;
 
typedef double watts;
typedef double joules;
typedef double farads;
typedef double volts;

#ifndef LIKELY
#define LIKELY(x)       __builtin_expect((int)(x),1)
#define UNLIKELY(x)     __builtin_expect((int)(x),0)
#endif


} // namespace SST

#endif
