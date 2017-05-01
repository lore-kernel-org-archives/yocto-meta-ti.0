Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D24C9E00AA2; Mon,  1 May 2017 12:39:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 558D3E00546
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:39:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41JdM6e026299
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493667562;
	bh=HXUIFZjm/A0a8YX3UmowL1X3zXPQf8XAItELjzMrtcg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OY6n1Nc4SRJY63lcXD4E+nw6wDzYdA4Ejh70Q3ZYYh3eAFQHCv2wYdjq13iJElZpX
	61e5p8ChHqIFlnunTyENNE8ZxzcHETqQVUWb0/9NUArFoYddpyuBku4BheEVjAaZn6
	pj4oel8/CnUC1giHtgcb9TsC8DngBtjgLsfOr3Hs=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JdMbx031736
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:39:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:39:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JdLgn016697;
	Mon, 1 May 2017 14:39:21 -0500
Date: Mon, 1 May 2017 15:39:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170501193920.GW31608@edge>
References: <20170501190150.4110-1-dmurphy@ti.com>
	<20170501190150.4110-4-dmurphy@ti.com>
	<20170501190959.GU31608@edge>
	<ac991d21-8bb8-c91a-0b12-651c6cfeea36@ti.com>
MIME-Version: 1.0
In-Reply-To: <ac991d21-8bb8-c91a-0b12-651c6cfeea36@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [v2 PATCH 4/4] boot-monitor: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:39:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 01, 2017 at 02:21:54PM -0500, Dan Murphy wrote:
> Denys
> 
> On 05/01/2017 02:10 PM, Denys Dmytriyenko wrote:
> > On Mon, May 01, 2017 at 02:01:50PM -0500, Dan Murphy wrote:
> >> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >> ---
> >>
> >> v2 - No changes
> >>
> >>  recipes-bsp/boot-monitor/boot-monitor_git.bb | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> >> index e4ea67f6..1b6f3206 100644
> >> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> >> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> >> @@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>  DEPENDS = "u-boot-mkimage-native"
> >>  
> >>  SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
> >> -SRC_URI += "file://0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch"
> > 
> > Can you also remove the corresponding patch file please? ^^^
> > 
> 
> Do I remove the whole files directory or just the file?

I believe there's just a single patch there, so it doesn't matter from git 
perspective.


> >>  PV = "4.0+git${SRCPV}"
> >>  
> >> @@ -16,7 +15,7 @@ BRANCH = "master"
> >>  
> >>  S = "${WORKDIR}/git"
> >>  
> >> -SRCREV = "d7b2bbd419400228da621f445526e519b56aef93"
> >> +SRCREV = "e1f885ab6dc544884728e333cc6e396f7eb08286"
> >>  
> >>  BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
> >>  
> >> -- 
> >> 2.12.2
> >>
> 
> 
> -- 
> ------------------
> Dan Murphy

