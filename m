Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B197EE00E0E; Thu, 15 Aug 2019 18:40:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 281E4E00D89
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 18:40:20 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7G1eK6A106335
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 20:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565919620;
	bh=NTcqjiTVPEaFCXdNyPasVglQKv1Mqpgdkvg5WrJ5upQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VyJYIfAH/eYfL3HOv4DwIP78JNydPdUzKUJZ2yf/tA5RSkIi0Qfo8IamzmLRX+2jD
	Enn8PVcxTGwcQPRtR2406QAweLXdk3s9eBecamKEAF0aIjJx3GqTSlJzgFYGfxyzkZ
	mqYtRe0sBhG5twqtxc1flo8IZvMd0UW7YeVhAWwQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7G1eK3g052820
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 20:40:20 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 15 Aug 2019 20:40:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 15 Aug 2019 20:40:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7G1eKnP035199;
	Thu, 15 Aug 2019 20:40:20 -0500
Date: Thu, 15 Aug 2019 21:40:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190816014019.GE2365@beryl>
References: <1565726493-32218-1-git-send-email-m-radhakrishnan2@ti.com>
	<55ec8d6a-5fed-ec7c-0534-959cc0fc0d90@ti.com>
MIME-Version: 1.0
In-Reply-To: <55ec8d6a-5fed-ec7c-0534-959cc0fc0d90@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [EXTERNAL] [thud/master][PATCH] sciclient-rtos: Adding support to j7-evm
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
X-List-Received-Date: Fri, 16 Aug 2019 01:40:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 13, 2019 at 04:17:32PM -0400, Jacob Stiffler wrote:
> 
> On 8/13/2019 4:01 PM, Mahesh Radhakrishnan wrote:
> >Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> >---
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> >diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> >index 36de7c4..8599f6a 100644
> >--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> >+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> >@@ -37,8 +37,13 @@ export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/pac
> >  #export DEST_ROOT="${S}"
> >  LIMSOCS_am65xx = "am65xx"
> >+LIMSOCS_j7-evm = "j721e"
> >+
> >  LIMBOARDS_am65xx = "am65xx_evm"
> >+LIMBOARDS_j7-evm = "j721e_evm"
> 
> Can you use the TI_PDK_LIMIT_* vars defined in the machine configuration?

Was this comment addressed?


> >  BOARD_PACKAGE_am65xx = "am65xx_evm"
> >+BOARD_PACKAGE_j7-evm = "j721e_evm"
> >  # HTML doc link params
> >  PDK_COMP_LINK_TEXT = "SCICLIENT"
> >@@ -66,7 +71,7 @@ do_compile() {
> >      # make clean LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> >      # Build am65xx libraries
> >-    make lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
> >+    make lib xdc_meta doxygen LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
> >      #archive
> >      tar -cf sciclient.tar --exclude='*.tar' ./*
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

