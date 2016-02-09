Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B67B5E00C2E; Tue,  9 Feb 2016 06:57:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76BE4E00B36
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 06:57:50 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u19EvmJr012260;
	Tue, 9 Feb 2016 08:57:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u19Evm00001721;
	Tue, 9 Feb 2016 08:57:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Feb 2016 08:57:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u19Evm0p023852;
	Tue, 9 Feb 2016 08:57:48 -0600
Date: Tue, 9 Feb 2016 09:57:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <winiston@futuraautomation.com>
Message-ID: <20160209145732.GC31480@edge>
References: <CC4ED3804AE84052A41A430A5FBCB3D1@RD3>
MIME-Version: 1.0
In-Reply-To: <CC4ED3804AE84052A41A430A5FBCB3D1@RD3>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Problem to build core-image-sato
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
X-List-Received-Date: Tue, 09 Feb 2016 14:57:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

You may need to check if your distro enables 'x11' feature.

But either way this has nothing to do with meta-ti, please direct your 
questions accordingly.

-- 
Denys


On Tue, Feb 09, 2016 at 03:06:44PM +0530, winiston@futuraautomation.com wrote:
> Dear,
> 
> Now I am using yocto  in our project. I am satisfied with yocto build system (poky) . 
> 
> Our system configuration :
> 
> Host system  : Ubuntu 14.04  (Virtual Machine )
> Target system :  am437x-evm
> 
> The following errors are spiting out while creating core-image-sato.
> 
> winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-satoLoading cache: 100% |###########################################| ETA:  00:00:00
> Loaded 1497 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'xf86-input-tslib' (but /home/winiston/poky/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'xf86-input-tslib' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['xf86-input-tslib']
> NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-xserver', 'xf86-input-tslib']
> NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', 'xf86-input-tslib']
> ERROR: Required build target 'core-image-sato' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-sato', 'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', 'xf86-input-tslib']
> 
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> What could be the reason? How do I solve this issues? 
> 
> second clarification is ,
> 
> Can I use “Navit” software in the core-image-sato image? If yes, What is the procedure?
> 
> Note: “Navit” is the open source navigation software build for arm/x86 based project.
> 
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
> 
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


