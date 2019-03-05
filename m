Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A0FDE00D24; Mon,  4 Mar 2019 16:31:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72BE7E00D11
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 16:31:22 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x250VL9J028396
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:31:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551745881;
	bh=Gwxdq/8IMVHNsC/NwKSj6OdeHhIL7QuH8yeoJnIcY0o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=P9+4SYvlPQ9HjNzM8XJa58gZjaKSBP7OvpzuTrquAvRsCDBk7yr26khLWINFZPWJL
	/GQcYlWulTDlQtlHfScffZ1xLf0Fs+geojxcAHO1lIkiL1PgcmpMrdARP8PoAU2hQ+
	KKl/ZlYNkAj79TGnOZprc2qtWq83dBuvtIiboRqY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x250VLxv065389
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:31:21 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 18:31:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 18:31:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x250VLEj007938;
	Mon, 4 Mar 2019 18:31:21 -0600
Date: Mon, 4 Mar 2019 19:31:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190305003121.GO26081@beryl>
References: <1551745392-62766-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551745392-62766-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551745392-62766-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] gcc-arm-none-eabi-native: Update to 7.0-2018-q2-update
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
X-List-Received-Date: Tue, 05 Mar 2019 00:31:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!
Please replace existing version 6 of the recipe. Also, please note it has been 
converted from pure native to native+nativesdk version.


On Mon, Mar 04, 2019 at 07:23:12PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../gcc-arm-none-eabi-native_7-2018-q2-update.bb   | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
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
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

