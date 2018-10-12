Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F14D7E00B92; Fri, 12 Oct 2018 12:58:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81A37E00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 12:58:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9CJw2ZD025223;
	Fri, 12 Oct 2018 14:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539374282;
	bh=Pah8LEgRBpV0v4ZCSmp8PnOlNk9Cc9aYr2/Iz/ujqFs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Goe+4zlqzTXlW6i24sw7cX1Z91yXeckYycIckouElfEEPYzmEaH9VcCI1RbUAR4PU
	cB5/gg9Jab+DwEq2IwvWcgqfaj13uoHVDYe7519aWbwYvIC1J4tKRWVWmtwqrE4V17
	V5ep2AFq/8O4sCwWMC9DYX0lwLBsPo1rpuHhw2hE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9CJw2el030064;
	Fri, 12 Oct 2018 14:58:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 12 Oct 2018 14:58:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 12 Oct 2018 14:58:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9CJw1EH015851;
	Fri, 12 Oct 2018 14:58:01 -0500
Date: Fri, 12 Oct 2018 15:58:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181012195801.GV19188@beryl>
References: <20181012195000.4545-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181012195000.4545-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone-getting-started: Use cp options to not alter file mode
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
X-List-Received-Date: Fri, 12 Oct 2018 19:58:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Are you still trying to do world builds? :)

Most of the places with this QA warning that are part of our builds were fixed 
before, but there are some outdated recipes like this one which were left out.


On Fri, Oct 12, 2018 at 12:50:00PM -0700, Khem Raj wrote:
> Fixes do_package_qa warnings
> <FILE> is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> index 603a01a7..6c61a4e9 100644
> --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
> +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> @@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
>  
>  do_install() {
>  	install -d ${D}${datadir}/${PN}
> -	cp -a ${S}/* ${D}${datadir}/${PN}
> +	cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/${PN}
>  }
>  
>  FILES_${PN} += "${datadir}/${PN}"
> -- 
> 2.19.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

