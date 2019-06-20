Return-Path: <angelabaker@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1FF7E009CF; Thu, 20 Jun 2019 15:02:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A25DE0096F
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 15:02:13 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KM2Cda074247
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 17:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561068133;
	bh=zbRb+Yj9BuKzOJmtPAEQwRP/2XVs24uLYJ64o5Z8n44=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=j8Kl5DS34jj/ASQkkfKBcol8banP22zXbdbD9FBe9piPDWn7HAC893iL01wl1Qkrf
	Kjx4sAL8VoUo+IoZ5d2XGtNuc32cDPeFcjwtVra7JZ6Fwfe6QPVQEW4AmSSHV1BvUp
	bVZs+IwjEt+ViRm2KhfmAhZe2Jby9ZTXxwPzBcrQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KM2C38128892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 17:02:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 17:02:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 17:02:12 -0500
Received: from [128.247.77.48] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KM2CdS004455;
	Thu, 20 Jun 2019 17:02:12 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <20190620212728.GD4849@beryl>
From: Angela Stegmaier <a0866189@ti.com>
Message-ID: <61bd3050-f8af-8f0a-881f-2920c0ecbf08@ti.com>
Date: Thu, 20 Jun 2019 17:02:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190620212728.GD4849@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] Test
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
X-List-Received-Date: Thu, 20 Jun 2019 22:02:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

test

On 6/20/19 4:27 PM, Denys Dmytriyenko wrote:
> Please ignore
> 

