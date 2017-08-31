Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5116E00A9C; Thu, 31 Aug 2017 06:28:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BC2EE0091D
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 06:28:46 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VDSkkD015454
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504186126;
	bh=BDZcFqJdidu+q3uyLHDSFgtVnbHnn/50EybL8PoF7l4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ewveYA7TtXBjmAXRI1UvvhMhrS6mZ7kiYn/wHNt1G/K7E1xzDprHSyMyXco+9ZKLb
	GIDjouGAd+F0HAORIWEX0gchsLd2wZdUv/As/LoczciDKH+SolSOI9SsKz8Dwdd3Vx
	RkGxGjhdO/yYy0obmLtVkLJ0IBw6IvhuAK49tVq4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDSkAA013600
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 08:28:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 31 Aug 2017 08:28:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 31 Aug 2017 08:28:45 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VDSj28019009;
	Thu, 31 Aug 2017 08:28:45 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
	<1504132936-7725-5-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <13e21177-ec0f-a885-55a7-3e54e252e014@ti.com>
Date: Thu, 31 Aug 2017 09:28:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504132936-7725-5-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v3 5/7] ti-ndk: Adding recipe for ti-ndk
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
X-List-Received-Date: Thu, 31 Aug 2017 13:28:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/30/2017 6:42 PM, Mahesh Radhakrishnan wrote:
> Upstreaming recipe for TI RTOS Networking development kit
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>
>   v3 - Removed references to srcipk
>   v2 - Added summmary  & merged in to a single recipe

These files are not merged anymore.

>
>   recipes-ti/ndk/ti-ndk.inc           | 21 +++++++++++++++++++++
>   recipes-ti/ndk/ti-ndk_2.25.01.11.bb | 13 +++++++++++++
>   2 files changed, 34 insertions(+)
>   create mode 100644 recipes-ti/ndk/ti-ndk.inc
>   create mode 100644 recipes-ti/ndk/ti-ndk_2.25.01.11.bb
>
> diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
> new file mode 100644
> index 0000000..09d9ea0
> --- /dev/null
> +++ b/recipes-ti/ndk/ti-ndk.inc
> @@ -0,0 +1,21 @@
> +SUMMARY = "TI RTOS_Networking"
> +HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/index.html"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +
> +require recipes-ti/includes/ti-paths.inc
> +
> +S = "${WORKDIR}/ndk_${PV}"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/${PV}/exports/ndk_${PV}.zip;name=ndkzip"
> +
> +do_install() {
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +    install -d ${D}${NDK_INSTALL_DIR_RECIPE}
> +    cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN}-dev += "${NDK_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"
> diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
> new file mode 100644
> index 0000000..d5d926b
> --- /dev/null
> +++ b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
> @@ -0,0 +1,13 @@
> +require ti-ndk.inc
> +
> +PV = "2_25_01_11"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=80a8d9b76cf700929d3f5b6df09052d6"
> +
> +SRC_URI[ndkzip.md5sum] = "e42bfcc8c3a6d183d60f26ec01ccc79b"
> +SRC_URI[ndkzip.sha256sum] = "a15bc9b570dc0628dd8b8c3665037a162610a6f86c5f17ebb6a329d3db60f071"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_SYSROOT_STRIP = "1"


