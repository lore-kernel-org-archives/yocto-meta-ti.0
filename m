Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E80EFE01405
	for <meta-ti@yoctoproject.org>; Fri, 26 Jul 2013 20:42:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6R3fsHM019712;
	Fri, 26 Jul 2013 22:41:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6R3fsOm017648;
	Fri, 26 Jul 2013 22:41:54 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Jul 2013 22:41:54 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6R3frQY030046;
	Fri, 26 Jul 2013 22:41:54 -0500
Date: Fri, 26 Jul 2013 23:41:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Gagneraud <chgans@gna.org>
Message-ID: <20130727034153.GG3558@edge>
References: <51F1AA6E.4050607@gna.org> <20130726210641.GF3558@edge>
	<321768C95D21724485BCE784F1BE98473EB80C27@DBDE04.ent.ti.com>
	<51F3E4AD.8070201@gna.org>
MIME-Version: 1.0
In-Reply-To: <51F3E4AD.8070201@gna.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [Qt5] mkspecs/devices: beagleboard == am335x ?
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
X-List-Received-Date: Sat, 27 Jul 2013 03:42:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Jul 28, 2013 at 03:18:05AM +1200, Christian Gagneraud wrote:
> On 07/27/2013 02:20 PM, Sundareson, Prabindh wrote:
> >The device approach is useful for adding platform specific hooks for
> >eglfs via EGLFS_PLATFORM_HOOKS_SOURCES, so it is a good thing. So it is
> >more of a convenience/cleaner way, than anything related to performance.
> >
> 
> I do agree with Dennys about the compiler flags, yocto knows what
> are the best flags for the machine/device.
> What is nice with the device file approach is the specification for
> OpenGL includes, libs, QPA and the EGLFS hooks as well.
> Basically I like the fact that all the OpenGL "mess" is sorted out
> in one place (when it comes to compilation).
> Interesting examples are the Rasberry Pi [1] and Freescale i.mx6 [2].
> 
> when considering Qt alone (out of Yocto/OE), I think as a SoC
> vendor, it is the best way to make sure your users get the best of
> Qt5/OpenGL, and very easily according to [3] (not tested).
> 
> 
> When it comes to Yocto, I didn't see any easy way for meta-bsp to
> tell meta-qt5 how to configure/build qt5 w/ OpenGL support.
> It seems to me that the only way is through the .bbappend, in qtbase.inc:
> [...]
> # if you want to enable egl/gles2 in your .bbappend, don't forget to
> add right dependencies, e.g.
> # GL_DEPENDS = "virtual/libgles2 virtual/egl"
> # QT_GLFLAGS = "-opengl es2 -eglfs"
> GL_DEPENDS ?= "virtual/libgl"
> QT_GLFLAGS ?= "-opengl"
> [...]
> 
> Could/should this be used by the meta-ti layer?
> 
> I spent some time recently going through meta-qt5 recently (as well
> as the qt4 stuff), I even tried an alternative configure/method, so
> far unsuccessfully. My feeling is that meta-qt5 tries to adapt qt5
> to OE, I think it should be done the other way around, that's my
> very personal view.
> 
> I really would like to see a Yocto Qt5 SDK one of these days.
> 
> Prabindh, could you tell more about the status of Qt5/OpenGL for TI
> SoCs, what about this commit [4]? Is it possible to build within
> Yocto Qt5 w/ OpenGL support for AM335x platforms?

Have you seen this thread:
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2139

-- 
Denys


> [1] http://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-rasp-pi-g++
> [2] http://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-imx6-g++
> [3] http://blog.qt.digia.com/blog/2012/04/13/cross-compiling-qt-for-the-masses/
> [4] https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c56410a
> 
> 
> >
> >regards
> >Prabindh
> >________________________________________
> >From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] on behalf of Dmytriyenko, Denys
> >Sent: Saturday, July 27, 2013 2:36 AM
> >To: Christian Gagneraud
> >Cc: meta-ti@yoctoproject.org
> >Subject: Re: [meta-ti] [Qt5] mkspecs/devices: beagleboard == am335x ?
> >
> >On Fri, Jul 26, 2013 at 10:45:02AM +1200, Christian Gagneraud wrote:
> >>Hi there,
> >>
> >>In qtbase sources, there are a couple of "device" definitions files,
> >>according to [1], this greatly help cross-compiling qt5.
> >>This device file specify things for CPU and GPU optimisations. So
> >>basically these files are tightly coupled with BSP providers.
> >>
> >>One of them is linux-beagleboard-g++ [2], is it appropriate to use
> >>this one for AM335x based platform as well?
> >>
> >>The meta-qt5 layer doesn't seem to use this feature, but if it did,
> >>would this device config files help to get an optimised Qt5 build
> >>for TI SoCs? Especially, would that help to get OpenGL stuff sorted
> >>out?
> >>
> >>Regards,
> >>Chris
> >>
> >>[1] http://blog.qt.digia.com/blog/2012/04/13/cross-compiling-qt-for-the-masses/
> >>[2] https://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-beagleboard-g++
> >
> >Chris,
> >
> >Looking at those files shows very basic compiler optimization flags being set,
> >-march, -mtune, -mfpu etc. I don't see any GL or GPU specifics in there. It
> >also hardcodes things like soft-fp, which is not good. All this stuff is
> >alredy taken care of by the build framework and I'm sure meta-qt5, like the
> >old qt4, sets all the right COMPILER_FLAGS to get the most performance from
> >the target CPU.
> >
> >--
> >Denys
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> >
> 

