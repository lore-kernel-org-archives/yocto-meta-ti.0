Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFB9BE016E3
	for <meta-ti@yoctoproject.org>; Mon,  4 Nov 2013 14:16:17 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA4MGFMJ001346;
	Mon, 4 Nov 2013 16:16:15 -0600
Received: from DLEE71.ent.ti.com ([157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA4MGFZf008921;
	Mon, 4 Nov 2013 16:16:15 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Nov 2013 16:16:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA4MGENp007017;
	Mon, 4 Nov 2013 16:16:15 -0600
Date: Mon, 4 Nov 2013 17:16:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Bernard Mentink <bmentink@gmail.com>
Message-ID: <20131104221613.GZ24696@edge>
References: <CALEed8YYeF-rT6PYb_Js+Ex=QZxHh=FJbuOYUgDTkuCDAmz-vw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALEed8YYeF-rT6PYb_Js+Ex=QZxHh=FJbuOYUgDTkuCDAmz-vw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel load issue
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
X-List-Received-Date: Mon, 04 Nov 2013 22:16:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 05, 2013 at 10:44:09AM +1300, Bernard Mentink wrote:
> Hi Guys,
> 
> I am having trouble loading some kernel CAN modules so that they go in my
> image.
> 
> I have the following lines in my layers .conf file:
> 
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-can-dev"
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-c_can"
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-c_can_platform"
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-can"
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-can-raw"
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-mcp2515"
> 
> all the modules end up in the rootfs except c_can and c_can_platform.

Because package names cannot have underscores, they are replaced with dashes.
So, corresponding packages to be installed in rootfs are kernel-module-c-can 
and kernel-module-c-can-platform.


> All modules are built as modules.
> 
> They end up in the deploy/images/modules* tarball, but not in the rootfs ..
> 
> Hopefully someone can suggest a solution.
> 
> Cheers,
> Bernie

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


