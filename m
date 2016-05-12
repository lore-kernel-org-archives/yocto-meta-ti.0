Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9412FE0093E; Thu, 12 May 2016 11:17:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 224 seconds by postgrey-1.32 at yocto-www;
	Thu, 12 May 2016 11:17:01 PDT
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 489AEE008B3
	for <meta-ti@yoctoproject.org>; Thu, 12 May 2016 11:17:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4CIDFjf007891;
	Thu, 12 May 2016 13:13:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CIDELt018999;
	Thu, 12 May 2016 13:13:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 May 2016 13:13:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4CIDEfh016788;
	Thu, 12 May 2016 13:13:14 -0500
Date: Thu, 12 May 2016 14:12:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Geoffrey Parker <Geoffrey.Parker@Arthrex.com>
Message-ID: <20160512181258.GT16188@edge>
References: <6C8F632E9A28D54CB9F9FD3A5BCBF90648548926@INC-S-EXC002.arthrex.local>
MIME-Version: 1.0
In-Reply-To: <6C8F632E9A28D54CB9F9FD3A5BCBF90648548926@INC-S-EXC002.arthrex.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS based on REDEPENDS
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
X-List-Received-Date: Thu, 12 May 2016 18:17:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 12, 2016 at 04:00:25PM +0000, Geoffrey Parker wrote:
> Hi Jacob, Denys,
> 
> I'm having a build issue once I pulled in the the 85810547 commit on the meta-ti fido branch:
> 
> ERROR: Nothing PROVIDES 'libgbm' (but /home/geoff/yocto/poky/meta-ti/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb DEPENDS on or otherwise requires it). Close matches:
>   libgxim
>   libsm
>   libqb
> NOTE: Runtime target 'omap5-sgx-ddk-um-linux-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['omap5-sgx-ddk-um-linux-dev', 'libgbm']
> NOTE: Runtime target 'omap5-sgx-ddk-um-linux-plugins' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['omap5-sgx-ddk-um-linux-plugins', 'libgbm']
> NOTE: Runtime target 'omap5-sgx-ddk-um-linux' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['omap5-sgx-ddk-um-linux', 'libgbm']
> 
> Looking at the meta-layer index I can only find libgbm in the meta-ti master & krogoth branches. 
> Our external layers are currently using the Yocto jethro branches except for meta-ti (which has 
> not jethro, so we use fido). We are not quite ready to move to krogoth yet.

Geoff,

Ah, I see. I recently moved libgbm from meta-arago to meta-ti. This hasn't 
been backported to fido, but probably should...

-- 
Denys

