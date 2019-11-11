Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D4BAE00D47; Mon, 11 Nov 2019 05:12:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCACDE0083D
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2019 05:12:04 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xABDC42X075730
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2019 07:12:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573477924;
	bh=JxyU3+K75WdsscqAth2lrTWbkt0KDms0UpN+rqJU8eY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=gneZVHwTxLro3MAUWKzpurn9pOJoNcBGuOj4onohOC7W0efnIuUfX80iAa84G1Hy6
	MWHZtSuLNRtBx4BFYVqDwjdg8QQy90/nMV78rkEOR4lVaDIlbJkD54LbT5f1ZsuNVl
	G37B21DXBgblU1vXeZEYLPXSGhkyM0igxxcmS3uo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xABDC4JV071961
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2019 07:12:04 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 11 Nov 2019 07:11:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 11 Nov 2019 07:11:46 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xABDC3Gw003127;
	Mon, 11 Nov 2019 07:12:03 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
	<20191108200016.GP7264@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b12a9920-f490-e45b-cad1-dcaea29db696@ti.com>
Date: Mon, 11 Nov 2019 08:11:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191108200016.GP7264@beryl>
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
X-List-Received-Date: Mon, 11 Nov 2019 13:12:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/8/2019 3:00 PM, Denys Dmytriyenko wrote:
> On Thu, Nov 07, 2019 at 12:49:55PM -0500, Jacob Stiffler wrote:
>> The PDK sources have been unified in a single git repository. To
>> simplify maintenance, a bbclass is added to specify the source
>> information. This class also extends the unpack task so that each
>> recipe is only presented with its component sources. This leaves
>> subsequent tasks (do_compile, etc) identical to previous sources.
>>
>> The source repo is not yet available, so submit as an RFC for now.
> Overall seems fine, but not clear about the version strategy - most recipes
> drop PV and bump PE, but not all. How would that be handled? Also, not clear
> about the licensing - will it be the same for entire PDK? I noticed at least
> one recipe changed LIC_FILES_CHKSUM w/o details...


There will be a common version across these recipes, aand this will be 
set in the ti-pdk-fetch.bbclass. I will look back over these to check 
for consistency. As for the specific version, I will check with the team.

For now, these recipes will retain the individual licenses. The only 
change to LIC_FILES_CHKSUM should have been the path prefix. This change 
was necessary due to the new fetch/unpack methods. Neither the files nor 
the checksums should have changed.



