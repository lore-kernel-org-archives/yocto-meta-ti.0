Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BCF5E00D01; Thu,  7 Mar 2019 14:50:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 755C4E0048C
	for <meta-ti@yoctoproject.org>; Thu,  7 Mar 2019 14:50:56 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x27MouXo074673
	for <meta-ti@yoctoproject.org>; Thu, 7 Mar 2019 16:50:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551999056;
	bh=AkGinW8WSyLpQwSf214FVsD3agzAQgwmDS3kKvsvsdY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TWNr9PuNETQOX9WMF12Zt0EyVPvHkbFRPOBPXn/Dkl0L5Pkh5wRhHYE52TIrA7ZNB
	ZdpdHW4rDbLAl46tk2g1TxX8Mla8KeFTUpi9gDlB90tbUNzRxXgEhS103Ow/Jd6YPv
	wyLoJfFQa6PekNVYSMKTrGvBbg8C0ybbKSya6SXE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x27MotWa066092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Mar 2019 16:50:56 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 7 Mar 2019 16:50:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 7 Mar 2019 16:50:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x27Mot2x016746;
	Thu, 7 Mar 2019 16:50:55 -0600
Date: Thu, 7 Mar 2019 17:50:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190307225055.GL26081@beryl>
References: <1551750335-10331-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551750335-10331-2-git-send-email-m-radhakrishnan2@ti.com>
	<20190305014906.GX26081@beryl>
MIME-Version: 1.0
In-Reply-To: <20190305014906.GX26081@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] ti-cgt-arm: Update to version 18.1.5 LTS
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
X-List-Received-Date: Thu, 07 Mar 2019 22:50:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 08:49:06PM -0500, Denys Dmytriyenko wrote:
> On Mon, Mar 04, 2019 at 08:45:35PM -0500, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  .../{ti-cgt-arm-native_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb}    | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb} (9%)
> > 
> > diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb b/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
> > similarity index 9%
> > rename from recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
> > rename to recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
> > index f642a5b..0ed1939 100644
> > --- a/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
> > +++ b/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
> > @@ -1,6 +1,6 @@
> >  include ti-cgt-arm.inc
> >  
> > -LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=1c0dc8c15d8c4768e399b9ce7651c25e"
> > +LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3faed35326711d6596f0377279323df1"
> 
> This one as well.

Was there a v2 for this one? I can't seem to find it.


> > -BINFILE_MD5 = "ccae16e9c6fc3749e7da49d3a2b6fb44"
> > -BINFILE_SHA256 = "13b66686cc012af6f2e7f021099b5bc735a461d8eb254a2b0edef0fd8b26e81e"
> > +BINFILE_MD5 = "d0559bccc323002a9256dd68e1d223ab"
> > +BINFILE_SHA256 = "8462eb7ce837274582721ed75c73928865d7678aca23b30fde962cdd36c21414"
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

