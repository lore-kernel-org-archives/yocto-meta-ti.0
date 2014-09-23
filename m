Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 043E6E00846; Tue, 23 Sep 2014 09:18:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 515ABE00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 09:18:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NGIio3010639
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:18:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGIikW004044
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:18:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 11:18:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGIhH9019671;
	Tue, 23 Sep 2014 11:18:43 -0500
Date: Tue, 23 Sep 2014 12:18:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140923161843.GO6303@edge>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-2-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1411488036-32089-2-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [for master 1/6] omapdrm-pvr: recipe update for SGX KM compatible with Kernel 3.12
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
X-List-Received-Date: Tue, 23 Sep 2014 16:18:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.

On Tue, Sep 23, 2014 at 09:30:31PM +0530, Karthik Ramanan wrote:
> * Also adapted recipe to directory restructuring
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> index a129e60..bd78b36 100644
> --- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> +++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> @@ -1,22 +1,22 @@
>  DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
>  HOMEPAGE = "http://git.ti.com"
>  LICENSE = "MIT | GPLv2"
> -LIC_FILES_CHKSUM = "file://README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
> +LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git"
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "86a4ffae3458c51f0a58e44b17b7a4fd92d2b8c6"
> +SRCREV = "bf8997b894f216261f914f64d33e6e588770da5a"
>  
>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
>  
>  do_compile_prepend() {
> -    cd ${S}/eurasiacon/build/linux2/omap5430_linux
> +    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap5430_linux
>  }
>  
>  do_install() {
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

