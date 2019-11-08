Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31BD2E00E18; Fri,  8 Nov 2019 12:00:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02A18E00E16
	for <meta-ti@yoctoproject.org>; Fri,  8 Nov 2019 12:00:18 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8K0HcY104908
	for <meta-ti@yoctoproject.org>; Fri, 8 Nov 2019 14:00:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573243217;
	bh=4mrzHXOpBnjQOCqe7lFnyHNuHGGcWzHHQVbYqXcvaUM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xpVCCkSiYaTII9fQI+nW0RuXkpZUDooxMRTklMdi2zySZ5Yvp0sOah9xxmiXN4PYb
	8xJp9Akr6QtdwE4osER/k0mZImq6stjwdaPuHiCg+cBlKGMGGVzypv253uXwp47gM8
	31XUTD4QRLI6pQseNCBgSTeUMPZC3jKPCZOiVZRY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8K0HYg025360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 8 Nov 2019 14:00:17 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 14:00:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 14:00:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8K0GPr098747;
	Fri, 8 Nov 2019 14:00:17 -0600
Date: Fri, 8 Nov 2019 15:00:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20191108200016.GP7264@beryl>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [master/thud][RFC 00/42] Unify PDK sources
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
X-List-Received-Date: Fri, 08 Nov 2019 20:00:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 07, 2019 at 12:49:55PM -0500, Jacob Stiffler wrote:
> The PDK sources have been unified in a single git repository. To
> simplify maintenance, a bbclass is added to specify the source
> information. This class also extends the unpack task so that each
> recipe is only presented with its component sources. This leaves
> subsequent tasks (do_compile, etc) identical to previous sources.
> 
> The source repo is not yet available, so submit as an RFC for now.

Overall seems fine, but not clear about the version strategy - most recipes 
drop PV and bump PE, but not all. How would that be handled? Also, not clear 
about the licensing - will it be the same for entire PDK? I noticed at least 
one recipe changed LIC_FILES_CHKSUM w/o details...

-- 
Denys

