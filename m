Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11FA6E0043B
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 08:41:38 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CGfavT002405;
	Wed, 12 Feb 2014 10:41:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGfaZQ007305;
	Wed, 12 Feb 2014 10:41:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 10:41:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CGfZEo001492;
	Wed, 12 Feb 2014 10:41:35 -0600
Date: Wed, 12 Feb 2014 11:41:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140212164135.GG4346@edge>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
	<CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
	<C969B5B7-2CF7-4815-819E-98FED7D07820@gmail.com>
	<CAHB-PjmYZUT03PPzHCkasVOoMBMUJWojbL8pMRpipATH6yGpjw@mail.gmail.com>
	<FFA7CA3D-C695-4C6D-90EC-F49E23F9E2E2@gmail.com>
	<CAHB-Pj=_sDdkbd0qjZVAWVs0f7c1HMiwfMnm13Ckys-UocVL=A@mail.gmail.com>
	<20140212162842.GF4346@edge>
	<24DEDB29-4F4C-48E9-9CB3-D1023ECBACD8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <24DEDB29-4F4C-48E9-9CB3-D1023ECBACD8@gmail.com>
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
X-List-Received-Date: Wed, 12 Feb 2014 16:41:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 12, 2014 at 08:38:04AM -0800, Khem Raj wrote:
> 
> On Feb 12, 2014, at 8:28 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Wed, Feb 12, 2014 at 03:15:38PM +0100, Richard Röjfors wrote:
> >> On Wed, Feb 12, 2014 at 3:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> 
> >>> 
> >>> On Feb 12, 2014, at 6:03 AM, Richard Röjfors <richard.rojfors@gmail.com>
> >>> wrote:
> >>> 
> >>> On Wed, Feb 12, 2014 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> 
> >>>> 
> >>>> what incompatibilities do you see between 4.7 and 4.8 ?
> >>>> 
> >>> 
> >>> I saw this in the gcc 4.8 changelog:
> >>> "On ARM, a bug has been fixed in GCC's implementation of the AAPCS rules
> >>> for the layout of vectors that could lead to wrong code being generated.
> >>> Vectors larger than 8 bytes in size are now by default aligned to an 8-byte
> >>> boundary. This is an ABI change: code that makes explicit use of vector
> >>> types may be incompatible with binary objects built with older versions of
> >>> GCC. Auto-vectorized code is not affected by this change.”
> >>> 
> >>> 
> >>> OK. are you seeing this use case here ?
> >>> 
> >> 
> >> Nope I've not hit it nor gone through the calls between the blobs and the
> >> surrounding code.
> >> 
> >> I just think it makes sense to compile the blobs with a compiler similar to
> >> the one provided by oe-core, to avoid the risk...
> > 
> > The biggest problem is not 4.7 vs. 4.8, but rather incompatibilities in ABIs 
> > and call conventions. E.g. we have switched to hardfp for our products and 
> > some of our components distributed in binary form are only available in hardfp 
> > format. And oe-core doesn't use hardfp by default yet…
> > 
> 
> yes thats a genuine concern, so when you publish prebuilt components then demand
> the required ABI compatibilities, but there isn’t much else one can do.

Indeed, I do this for now:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb#n25

I was hoping this would be a temporary limitation and there might be a softfp 
binary released too...

-- 
Denys

