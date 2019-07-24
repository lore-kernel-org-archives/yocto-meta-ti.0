Return-Path: <afd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B631CE00E0F; Wed, 24 Jul 2019 14:08:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18834E00E07
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 14:08:07 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OL874K116303
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 16:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564002487;
	bh=l5O4MQRv/+xZrknC4SM9l4IwBDp9ee0eCqTyk3LUiFk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=dGYgfuqs0vHEIdE5nXEB+/4fxrC6VTb5uXTCrmH5VSp0GK0/r6yPeBUeS8PtfokC6
	8uIcizKkZWbjC2GYChLwOJhJH1DKJFhqo1NIVXYt7/TXLe2VhB7frKhFDOH2ybcYel
	IgshtmMbOhrtchjKW4pSMo9EyBEaOURFp+S5m5Hg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OL87Zx079153
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 16:08:07 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Jul 2019 16:08:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Jul 2019 16:08:07 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OL86UP017241;
	Wed, 24 Jul 2019 16:08:07 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190719210619.18583-1-afd@ti.com>
	<20190719210619.18583-3-afd@ti.com> <20190724191412.GE5700@beryl>
	<0c9d5d9a-064c-2481-eff1-90fe69195549@ti.com>
	<20190724200834.GH5700@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <1412397e-118a-04c4-5f0a-7628fbaa8bed@ti.com>
Date: Wed, 24 Jul 2019 17:08:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724200834.GH5700@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][RFC PATCH 3/3] ti-sgx-ddk-um: Drop omap5-sgx-ddk-um-linux package
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
X-List-Received-Date: Wed, 24 Jul 2019 21:08:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/24/19 4:08 PM, Denys Dmytriyenko wrote:
> On Wed, Jul 24, 2019 at 03:30:57PM -0400, Andrew F. Davis wrote:
>> On 7/24/19 3:14 PM, Denys Dmytriyenko wrote:
>>> On Fri, Jul 19, 2019 at 05:06:19PM -0400, Andrew F. Davis wrote:
>>>> No one depends on this and it does not really get built,
>>>> remove this from PROVIDES.
>>>
>>> Bah, such a nice commit message. :)
>>>
>>> Seriously though, it is there for backward compatibility. That was the name 
>>> of this package few years ago. Sure, "it does not get built", but claiming 
>>> that "no one depends on this" is really a guess. There might be old recipes 
>>> out there depending on this package by its old name...
>>>
>>> Anyway, I don't mind dropping this backward compatibility, since it's been 
>>> several years already, but I would like to see a better commit message.
>>
>> How does backwards compat work with Yocto? Are you saying for out of
>> tree recipes? If so I'll change the wording to "No one *in-tree* depends
>> on this".
> 
> Yes, out-of-tree. Yocto Project embraces layered structure. There are tons of 
> layers with interdependencies. There could be outdated layers (potentially 
> customers) that use the old name. In order to drop backward compatibility, we 
> need to provide a clear message.
> 

Okay, that makes sense, will update the message with some more details.

Thanks,
Andrew

