Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB9BFE009A4; Thu, 27 Jul 2017 06:50:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A299FE0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 06:50:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RDnxf7015009
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501163399;
	bh=2fqTUTLyW0oQLinpvA6uPlhS7jLaAb9bVu+Tx5aVs0c=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=WylRipiae56xpU8herVImcMVezIcrmnolqVVjcEpY9EYZP2Csg53GWKh5qWnWjLK+
	5pTbcgg9lnYpwyzEnwGXLLMW8KaMOpb7leScgckhPsodUa5JwBZX71/Hff4katDztd
	8TZXAzU5nIKC3V3f5L6itsO9LILCESZaHbS8uok4=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDnxP6015162
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 08:49:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 08:49:59 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RDnxq5021948;
	Thu, 27 Jul 2017 08:49:59 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-34-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <46cca45d-7f1b-a9fa-aa65-359d13ebf35c@ti.com>
Date: Thu, 27 Jul 2017 09:49:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-34-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH v2 34/37] ti-ndk: Adding recipe for ti-ndk
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
X-List-Received-Date: Thu, 27 Jul 2017 13:50:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/18/2017 7:03 PM, Mahesh Radhakrishnan wrote:
> Upstreaming recipe for TI RTOS Networking development kit
>
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>
> v2 - Added summmary  & merged in to a single recipe
>
>   recipes-ti/ndk/ti-ndk.inc           | 21 +++++++++++++++++++++
>   recipes-ti/ndk/ti-ndk_2.25.01.11.bb | 17 +++++++++++++++++
>   2 files changed, 38 insertions(+)
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
> index 0000000..4369567
> --- /dev/null
> +++ b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
> @@ -0,0 +1,17 @@
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
> +
> +deltask do_create_srcipk
> +addtask create_srcipk after do_install before do_package

The "create_srcipk" task is provided in meta-arago, and should be 
removed from here.

> +


