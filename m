Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FE10E0043B
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 08:28:45 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CGShOW008983;
	Wed, 12 Feb 2014 10:28:43 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGShmH025737;
	Wed, 12 Feb 2014 10:28:43 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 10:28:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGSh2O027270;
	Wed, 12 Feb 2014 10:28:43 -0600
Date: Wed, 12 Feb 2014 11:28:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Richard =?iso-8859-1?Q?R=F6jfors?= <richard.rojfors@gmail.com>
Message-ID: <20140212162842.GF4346@edge>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
	<CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
	<C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
	<CAHB-PjmYZUT03PPzHCkasVOoMBMUJWojbL8pMRpipATH6yGpjw@mail.gmail.com>
	<FFA7CA3D-C695-4C6D-90EC-F49E23F9E2E2@gmail.com>
	<CAHB-Pj=_sDdkbd0qjZVAWVs0f7c1HMiwfMnm13Ckys-UocVL=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHB-Pj=_sDdkbd0qjZVAWVs0f7c1HMiwfMnm13Ckys-UocVL=A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard/omap4 support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Feb 2014 16:28:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 12, 2014 at 03:15:38PM +0100, Richard Röjfors wrote:
> On Wed, Feb 12, 2014 at 3:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> >
> > On Feb 12, 2014, at 6:03 AM, Richard Röjfors <richard.rojfors@gmail.com>
> > wrote:
> >
> > On Wed, Feb 12, 2014 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >> what incompatibilities do you see between 4.7 and 4.8 ?
> >>
> >
> > I saw this in the gcc 4.8 changelog:
> > "On ARM, a bug has been fixed in GCC's implementation of the AAPCS rules
> > for the layout of vectors that could lead to wrong code being generated.
> > Vectors larger than 8 bytes in size are now by default aligned to an 8-byte
> > boundary. This is an ABI change: code that makes explicit use of vector
> > types may be incompatible with binary objects built with older versions of
> > GCC. Auto-vectorized code is not affected by this change.”
> >
> >
> > OK. are you seeing this use case here ?
> >
> 
> Nope I've not hit it nor gone through the calls between the blobs and the
> surrounding code.
> 
> I just think it makes sense to compile the blobs with a compiler similar to
> the one provided by oe-core, to avoid the risk...

The biggest problem is not 4.7 vs. 4.8, but rather incompatibilities in ABIs 
and call conventions. E.g. we have switched to hardfp for our products and 
some of our components distributed in binary form are only available in hardfp 
format. And oe-core doesn't use hardfp by default yet...

-- 
Denys

