Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B241E00D28; Mon,  4 Mar 2019 16:34:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB145E00BCC
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 16:34:21 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x250YLgs029527
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:34:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551746061;
	bh=AOgjSaU4KF40LbVj4k0/CnDhxYe/wEZGljazN4ymdR0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=sQd/f7YZNNA0PpQuDJv6wV8RSmjARFzd2cortHBiAhQCitB3tsFaicPxXTlrIlMNO
	wizclZrvbVQ9f3avUBGLgbgB1bkmwxOaRV7bB+FjXPaI/L46Ap+MnY2oeXjULQ9R9g
	H5O0ph2AO/iu/ZBg2ZEhZubQL+bQyO0vn5Jwwsio=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x250YL83024670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:34:21 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 18:34:21 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 18:34:21 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x250YKkO019066;
	Mon, 4 Mar 2019 18:34:21 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1551745392-62766-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551745392-62766-2-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d2aea05e-6bec-a6d3-e79e-ca6d575afcca@ti.com>
Date: Mon, 4 Mar 2019 19:34:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1551745392-62766-2-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH] gcc-arm-none-eabi-native: Update to 7.0-2018-q2-update
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
X-List-Received-Date: Tue, 05 Mar 2019 00:34:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

NAK

Please update this so that it matches recent changes so that nativesdk 
is supported.

There's also been some discussion on the list in regards to other 
changes. See 
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=rocko&id=fb48c2fbfd422e00b27c0f1c097063f317fcc46a 
, https://lists.yoctoproject.org/pipermail/meta-ti/2019-March/011600.html

And do we still need the old versions?


- Jake

On 3/4/2019 7:23 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   .../gcc-arm-none-eabi-native_7-2018-q2-update.bb   | 23 ++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
>
> diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
> new file mode 100644
> index 0000000..41dff5b
> --- /dev/null
> +++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Baremetal GCC for ARM"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"
> +
> +inherit native
> +require recipes-ti/includes/ti-paths.inc
> +
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2;name=gcc-arm-none"
> +
> +SRC_URI[gcc-arm-none.md5sum] = "299ebd3f1c2c90930d28ab82e5d8d6c0"
> +SRC_URI[gcc-arm-none.sha256sum] = "bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69"
> +
> +S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
> +
> +do_install() {
> +    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> +    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> +}
> +
> +FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
> +
> +INSANE_SKIP_${PN} = "already-stripped"

