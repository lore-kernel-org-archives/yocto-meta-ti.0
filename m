Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82521E013DE
	for <meta-ti@yoctoproject.org>; Fri, 26 Jul 2013 14:06:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6QL6gDt024270;
	Fri, 26 Jul 2013 16:06:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6QL6gO7026562;
	Fri, 26 Jul 2013 16:06:42 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Jul 2013 16:06:42 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6QL6gNT025196;
	Fri, 26 Jul 2013 16:06:42 -0500
Date: Fri, 26 Jul 2013 17:06:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Gagneraud <chgans@gna.org>
Message-ID: <20130726210641.GF3558@edge>
References: <51F1AA6E.4050607@gna.org>
MIME-Version: 1.0
In-Reply-To: <51F1AA6E.4050607@gna.org>
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
X-List-Received-Date: Fri, 26 Jul 2013 21:06:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 26, 2013 at 10:45:02AM +1200, Christian Gagneraud wrote:
> Hi there,
> 
> In qtbase sources, there are a couple of "device" definitions files,
> according to [1], this greatly help cross-compiling qt5.
> This device file specify things for CPU and GPU optimisations. So
> basically these files are tightly coupled with BSP providers.
> 
> One of them is linux-beagleboard-g++ [2], is it appropriate to use
> this one for AM335x based platform as well?
> 
> The meta-qt5 layer doesn't seem to use this feature, but if it did,
> would this device config files help to get an optimised Qt5 build
> for TI SoCs? Especially, would that help to get OpenGL stuff sorted
> out?
> 
> Regards,
> Chris
> 
> [1] http://blog.qt.digia.com/blog/2012/04/13/cross-compiling-qt-for-the-masses/
> [2] https://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-beagleboard-g++

Chris,

Looking at those files shows very basic compiler optimization flags being set, 
-march, -mtune, -mfpu etc. I don't see any GL or GPU specifics in there. It 
also hardcodes things like soft-fp, which is not good. All this stuff is 
alredy taken care of by the build framework and I'm sure meta-qt5, like the 
old qt4, sets all the right COMPILER_FLAGS to get the most performance from 
the target CPU.

-- 
Denys

