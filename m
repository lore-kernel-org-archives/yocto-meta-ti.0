Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0F00E00D3A; Tue,  3 Oct 2017 12:49:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25E81E00D27
	for <meta-ti@yoctoproject.org>; Tue,  3 Oct 2017 12:49:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93JnXaF003222
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 14:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507060173;
	bh=ARUN34ox07kCrcKl1c+f1Z8n9JCVTqlY8RRX9AC0NRk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DRsV2CrCh0BwcVdf0M9qvzxYbqn80Ym97ALK73SnipIxtNyBJeHOYwHvC7FvghvE7
	TreTBhri5eypVEemoGHK9eu6gq9uekp0qW0CjYDKVJB09YsY+P6+Ccic2X89Cwb0XQ
	a5ucAxSKzV21h8eUHI9/OnvMkv6CIzStwchH2ejc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93JnSGn013701
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 14:49:28 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 14:49:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 14:49:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93JnS2K019122;
	Tue, 3 Oct 2017 14:49:28 -0500
Date: Tue, 3 Oct 2017 15:49:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20171003194912.GU8393@edge>
References: <1507029285-5066-1-git-send-email-sam.nelson@ti.com>
	<1507029285-5066-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1507029285-5066-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH 2/4] ti-sysbios: Add recipe for new version 6.52.00.12
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
X-List-Received-Date: Tue, 03 Oct 2017 19:49:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

You seem to be updating baremetal gcc from version 4 to version 6, but here 
you are adding new sysbios version, leaving old one alone. Will it break the 
old version of sysbios or does it build/work fine with the new gcc?

On Tue, Oct 03, 2017 at 07:14:43AM -0400, Sam Nelson wrote:
> Linux installer binary file name has changed compared to previous
> version
> Break backward compatibilty for A15 gcc tools: requires gcc-arm-none-
> eabi-6-2017-q1-update or later
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.52.00.12.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.52.00.12.bb
> 
> diff --git a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
> new file mode 100644
> index 0000000..2bbe881
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
> @@ -0,0 +1,16 @@
> +require recipes-ti/bios/ti-sysbios.inc
> +
> +PV = "6_52_00_12"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=ca549c223d732e6f69efc449795c4eeb"
> +
> +SRC_URI[sysbiosbin.md5sum] = "3c16af0843b5b6c5ff10512d1b586665"
> +SRC_URI[sysbiosbin.sha256sum] = "4a2b9b76f52a57f02725337db9361787eae4c917d7cf989a697ed41eb4a1e701"
> +
> +TI_BIN_UNPK_CMDS = ""
> +TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> +
> +BINFILE = "bios_${PV}.run"
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
> +
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

