Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6018EE01618
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 06:23:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8NDNhqx032651;
	Mon, 23 Sep 2013 08:23:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NDNhcD020702;
	Mon, 23 Sep 2013 08:23:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 08:23:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NDNhp2021145;
	Mon, 23 Sep 2013 08:23:43 -0500
Date: Mon, 23 Sep 2013 09:23:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Leonid Iziumtsev <leonid.iziumtsev@globallogic.com>
Message-ID: <20130923132342.GA3456@edge>
References: <CAAtecJGYGsuMf807WCQ4c4Qt6LaE=39gEMXeKE_Z64eYZv4KXg@mail.gmail.com>
	<CAAtecJHF87AjpXtDQo0U5n_ah28SJF__m1xcqHbvFOLqvOaDcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAtecJHF87AjpXtDQo0U5n_ah28SJF__m1xcqHbvFOLqvOaDcw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: omap5: 3d graphics hardware acceleration build
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
X-List-Received-Date: Mon, 23 Sep 2013 13:23:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 23, 2013 at 01:15:11PM +0300, Leonid Iziumtsev wrote:
> Hi all,
> 
> Pardon me if this list is not the right place to ask the questions and if
> so, please poing me to the right one.
> 
> I'm developer in Panasonic Inc. Currently working with OAMP5 (pandaboard
> uevm) I'm trying to get build with 3D graphics hardware acceleration using
> DirectFB (no X support recurred). In future hopefully going run some Qt
> based UI.
> In search I came across "meta-ti" layer.
> 
> I'm new in yocto based build system so don't
> completely understand: is it what I was looking for? Will it allow me to
> get build with proper graphic support?

Leonid,

Yes, this is the correct layer for OMAP5 uEVM support. But 3D Graphics is not 
yet available - there were some patches being developed, but they haven't been 
finalized yet.

-- 
Denys

