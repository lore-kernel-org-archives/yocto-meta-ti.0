Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 465C2E01756
	for <meta-ti@yoctoproject.org>; Tue, 29 Oct 2013 13:01:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9TK1S5X028833;
	Tue, 29 Oct 2013 15:01:28 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9TK1RJQ013143;
	Tue, 29 Oct 2013 15:01:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 29 Oct 2013 15:01:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9TK1Ri7029561;
	Tue, 29 Oct 2013 15:01:27 -0500
Date: Tue, 29 Oct 2013 16:01:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anders Darander <anders@chargestorm.se>
Message-ID: <20131029200127.GM22054@edge>
References: <20131025080849.GB8552@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20131025080849.GB8552@ad.chargestorm.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: meta-ti/arago support for TI8148
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
X-List-Received-Date: Tue, 29 Oct 2013 20:01:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 25, 2013 at 10:08:49AM +0200, Anders Darander wrote:
> Hi,
> 
> I've got a customer using a dm8148 SoC, and though I'm not yet tasked
> with helping them with the build system (I've got some lower level task
> I'm helping them with), I suspect that it's just a matter of time before
> they ask me to help setup their build environment.
> 
> I know that there was a commit in ~April that removed TI8148 from
> meta-ti, stated that this machine were no longer supported. However,
> from that commit message I can't really conclude whether it was
> supported and working up until that, or if it had been non-functioning
> for quite some time.
> 
> Has there been working support for TI8184 in meta-ti (i.e. after the
> move to a oe-core based setup)? Or is the last supported version found
> elsewhere?
> 
> To summarise my question; what's the latest version that
> supports/supported the TI8184? meta-ti, meta-arago, arago, or where?
> I'd be happy for any pointers regarding this. 

Anders,

The last supported kernel version for TI8148 was 2.6.37. There was still some 
work being done to fix reported issues (look around arago-project.org repos), 
but no new versions were planned or worked on. One of the biggest reasons to 
remove the support from meta-ti/danny was due to everyone expecting to get it 
updated to 3.x (which wasn't happening) and also because we were starting to 
see more and more incompatibilities between 2.6.37 kernel and new toolchains 
and new userspace system tools, like udev/systemd etc.

So, your best bet would be to either start with a corresponding EzSDK for that 
platform, or try to match toolchain and userspace that was available around 
the time 2.6.37 was relevant...

-- 
Denys

