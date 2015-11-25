Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46536E00A73; Wed, 25 Nov 2015 15:09:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B201E0088C
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 15:09:49 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPN9n0K010268
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 17:09:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN9nvE002071
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 17:09:49 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 17:09:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN9mfl023250;
	Wed, 25 Nov 2015 17:09:48 -0600
Date: Wed, 25 Nov 2015 18:09:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20151125230932.GH28188@edge>
References: <1448492021-887-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1448492021-887-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/2] Enable non-SGX build for AM3/AM4
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
X-List-Received-Date: Wed, 25 Nov 2015 23:09:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This doesn't look right. Why would you want to even build omapdrm-pvr and/or 
DDK UM when SGX is not available?


On Wed, Nov 25, 2015 at 05:53:39PM -0500, Eric Ruei wrote:
> From: Eric Ruei <a0850410@uda0850410>
> 
> Enhance meta-ti (and meta-arago) recipes to enable SGX/software rendering 
> graphics support based on whether or not SGX is included at Machine Feature
> list.
> 
> Eric Ruei (2):
>   omapdrm_pvr: Define PVR_NULLDRM based on the availability of SGX
>   omap5-sgx-ddk-um-linux: Configure DDK UM based on the availability of
>     SGX
> 
>  recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |  2 +-
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb             | 14 ++++++++------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

