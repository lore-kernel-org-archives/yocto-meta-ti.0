Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77CE3E00D2A; Fri, 28 Jul 2017 10:15:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46D24E00B8D
	for <meta-ti@yoctoproject.org>; Fri, 28 Jul 2017 10:14:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6SHExEF005094
	for <meta-ti@yoctoproject.org>; Fri, 28 Jul 2017 12:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501262099;
	bh=Xun1S3qrYdB/ulWf4y2twN0HK4Rnahb1kZnWVVQSYy8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JR/ruVa4WfBEZXwfPfdLHXojMoSXtUXljU/LRWbON3wg+qmMX3Y51/2IGSjwZMRup
	eGsD7G5oGC8XojjWhkVtm4opeILS3ziNqSqDWzSI49ef9y4rj+tMOaUnhMwg1TawMV
	eFHfn3aw2dv9gSGeQjOHUU5RWqB6F9NXMmmm8rZc=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6SHExJG027607
	for <meta-ti@yoctoproject.org>; Fri, 28 Jul 2017 12:14:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Jul 2017 12:14:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6SHEwH4004591;
	Fri, 28 Jul 2017 12:14:58 -0500
Date: Fri, 28 Jul 2017 13:14:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170728171455.GV18367@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-10-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-10-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 10/37] uart-lld-rtos: Added rtos recipe for uart-lld
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
X-List-Received-Date: Fri, 28 Jul 2017 17:15:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 18, 2017 at 07:03:21PM -0400, Mahesh Radhakrishnan wrote:
> Upstreaming RTOS PDK driver for UART module
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
> v2 - Adding description & merging in to a single recipe
> 
>  recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 41 +++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> 
> diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> new file mode 100644
> index 0000000..df5dce7
> --- /dev/null
> +++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION = "TI RTOS low level driver for Universal Asynchronous Receiver/Transmitter (UART) module "

Still need a shorter SUMMARY, even when long DESCRIPTION is present.


> +
> +inherit ti-pdk
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://UART.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +UART_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/uart-lld.git"
> +UART_LLD_GIT_PROTOCOL = "git"
> +UART_LLD_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.07A"
> +UART_LLD_SRCREV = "884e340f5d2f004de99e44f014fedb781f1fb975"
> +
> +BRANCH = "${UART_LLD_GIT_BRANCH}"
> +SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${UART_LLD_SRCREV}"
> +PV = "01.00.00.07A"
> +PR = "r0"
> +
> +DEPENDS_append = " edma3-lld-rtos \
> +                   osal-rtos \
> +"
> +DEPENDS_append_ti33x = " starterware-rtos"
> +DEPENDS_append_ti43x = " starterware-rtos"
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +export PDK_UART_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${S}"
> +
> +export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> +XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "UART LLD"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

