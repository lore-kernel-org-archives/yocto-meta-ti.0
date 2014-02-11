Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAC97E006B9
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 06:46:01 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BEjr1B025279;
	Tue, 11 Feb 2014 08:45:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BEjrlO008445;
	Tue, 11 Feb 2014 08:45:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Feb 2014 08:45:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BEjqQZ004368;
	Tue, 11 Feb 2014 08:45:52 -0600
Date: Tue, 11 Feb 2014 09:45:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140211144551.GF3131@edge>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Tue, 11 Feb 2014 14:46:02 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

There were several updates and fixes since 4.09.00.01 version of Graphics SDK, 
the latest being 5.01.00.01. Unfortunately, X11 and DRM handling was not 
supported and un-tested for some time, but 5.01.00.01 was meant to fix some of 
those issues...

-- 
Denys


On Mon, Feb 10, 2014 at 03:48:19PM -0200, Diego Sueiro wrote:
> Folks,
> 
> Any update on this?
> I'm facing with the same issue.
> 
> I'm using poky and meta-ti on dora branch.
> 
> 
> Regards,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br
> 
> /*long live rock 'n roll*/
> 
> 
> On Sat, Aug 10, 2013 at 12:48 PM, Kovesdi Gyorgy <kgy@teledigit.eu> wrote:
> 
> > > It appears you are trying to build a drm driver - correct ?
> > Yes, i would need a working OpenGL on my Beagleboard-C4 with 3.x kernel.
> > (4.05
> > works well with 2.6 but crashes with 3.x)
> >
> > > ________________________________________
> > > From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org]
> > on
> > > behalf of Kovesdi Gyorgy [kgy@teledigit.eu] Sent: Saturday, August 10,
> > 2013
> > > 4:28 PM
> > > To: meta-ti mailing list
> > > Subject: [meta-ti] How to compile omap3-sgx-modules_4.09.00.01
> > >
> > > Hi,
> > >
> > > I tried to compile recent versions (4.08 or 4.09) of SGX modules for my
> > > Beagleboard-C4 using the current Yoctoproject environment (tried Poky,
> > > beagleboard-dylan-9.0.0, and Angstrom Linux with the same result).
> > >
> > > In every case i got this error message:
> > > | make[3]: *** No rule to make target
> > >
> > > `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
> > > gnueabi/omap3-sgx-modules/4.09.00.01-
> > >
> > r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_
> > > auth.o', needed by
> > > `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
> > > gnueabi/omap3-sgx-modules/4.09.00.01-
> > >
> > r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm.
> > > o'. Stop.
> > >
> > > Please help me to compile it!
> > >
> > > Thanx in advance
> > > György Kövesdi
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


