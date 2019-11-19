Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9667EE00E12; Tue, 19 Nov 2019 10:25:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33C74E00DD3
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2019 10:25:03 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJIP3cL077550;
	Tue, 19 Nov 2019 12:25:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574187903;
	bh=f+UoTWmn6bW/6pgbyyYQ3WO6sxcK9o3SiXT7hlK1tIY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sCl+KK0SmdFfyGhNTuMK2HwWdwJBafiKtOysrpO4XIyQUjaU9X+u0AtXM7c/EG/TO
	p0JBiGpTXNsBtaVlTPNCsF3qZR81LrHG3H7NGvfEbMY0Leh94JrOIWw1ZqwypnI74H
	CTeQlJvkspfVUJzEe/eoh8B1p0R3hAIemDho6xig=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJIP2wh079239;
	Tue, 19 Nov 2019 12:25:03 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 19 Nov 2019 12:25:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 19 Nov 2019 12:25:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJIP1Ag086955;
	Tue, 19 Nov 2019 12:25:01 -0600
Date: Tue, 19 Nov 2019 13:25:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Colin Bester <colin.bester@biocharger.com>
Message-ID: <20191119182501.GG27719@beryl>
References: <5B61D358-0332-46AF-B815-C49CBD1433C5@biocharger.com>
MIME-Version: 1.0
In-Reply-To: <5B61D358-0332-46AF-B815-C49CBD1433C5@biocharger.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: Equivalence to shipped BBB
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
X-List-Received-Date: Tue, 19 Nov 2019 18:25:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Nov 17, 2019 at 08:56:00AM -0600, Colin Bester wrote:
> Can one create BBB image as is currently shipped today using yocto and 
> meta-ti or is additional building/installation required after creation of 
> image via yocto?

And by "shipped BBB" do you mean Debian images? If so, it should be possible 
to reproduce them in Yocto, but currently there are no ready-made recipes 
available for those images.

-- 
Denys

