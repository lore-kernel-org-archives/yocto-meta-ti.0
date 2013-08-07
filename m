Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37A60E006E5
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2013 11:55:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r77It53L016481;
	Wed, 7 Aug 2013 13:55:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r77It5F8019152;
	Wed, 7 Aug 2013 13:55:05 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 7 Aug 2013 13:55:05 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r77It5eV011366;
	Wed, 7 Aug 2013 13:55:05 -0500
Date: Wed, 7 Aug 2013 14:55:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Kovesdi Gyorgy <kgy@teledigit.eu>
Message-ID: <20130807185504.GD23226@edge>
References: <1477888.0bvqrzpNgz@kgy-pc>
MIME-Version: 1.0
In-Reply-To: <1477888.0bvqrzpNgz@kgy-pc>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Select proper versions for Beagleboard-C4
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
X-List-Received-Date: Wed, 07 Aug 2013 18:55:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 07, 2013 at 09:41:04PM +0200, Kovesdi Gyorgy wrote:
> Hi,
> 
> I have a Beagleboard-C4 and would like to have a working environment with 
> OpenGL support. My question is which kernel and which TI driver version is 
> necessary to do this.
> Currently the kernel 2.6.39 and 4.05.00.03 is the only working combination for 
> me, but it would be necessary to use 3.x kernel.
> I tried the followings:
> 3.x kernel with 4.05.00.03: it leads to kernel crash (see my previous mail).
> 3.8.13 kernel with any newer TI version (>= 4.08.*): cannot be compiled, the 
> result is the following:
> | make[3]: *** No rule to make target `/home/kgy/work/Angstrom/try-007-
> X/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-
> gnueabi/omap3-sgx-modules-4.08.00.01-
> r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm_auth.o', 
> needed by `/home/kgy/work/Angstrom/try-007-X/build/tmp-angstrom_v2012_12-
> eglibc/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-4.08.00.01-
> r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/drm.o'.  
> Stop.
> | make[2]: *** [/home/kgy/work/Angstrom/try-007-X/build/tmp-angstrom_v2012_12-
> eglibc/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-4.08.00.01-
> r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm] Error 
> 2
> 
> Please show me a working combination.

I'm not sure about your setup, since 4.05.00.03 is super old. 

4.08.* is more recent, but still not the latest.

4.09.* seems to work fine with latest 3.2-3.8 kernels.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/

-- 
Denys

