Return-Path: <afd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69710E0098A; Mon, 16 Sep 2019 08:47:31 -0700 (PDT)
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
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AE89E008E0
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 08:47:30 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GFlTft115075;
	Mon, 16 Sep 2019 10:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568648849;
	bh=/yAQGvrUd/6R00zBolncTJf8NJSDU1+ESCzEBn7GaKA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=eXJrwg9x3pNALrhV+QOn8+Sh8psExbfmbqmJAcHbWZgOzW0IjE06VCBzjx4upCeRw
	SUzvqVmjoBQdJ1r5wOKkzIqjQaPEGebo+HiB3IM1OePneTFC0jLmvFH/SaO6KvbL00
	n9/wPEfS4W28IQ5Kt2eGLn7bT3exfTgniJ5Kd+5w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GFlTCf092756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Sep 2019 10:47:29 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 10:47:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 10:47:29 -0500
Received: from [10.250.95.88] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GFlSOw071823;
	Mon, 16 Sep 2019 10:47:28 -0500
To: Robert Nelson <robertcnelson@beagleboard.org>
References: <20190914135151.3619-1-afd@ti.com>
	<CAOCHtYjjRM5LDKrQgU9nYaAEo4TZP82Xpw-RzDez8G0_tTuQgQ@mail.gmail.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <08d2c002-3c7f-abc4-823d-e108b54b6d95@ti.com>
Date: Mon, 16 Sep 2019 11:47:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOCHtYjjRM5LDKrQgU9nYaAEo4TZP82Xpw-RzDez8G0_tTuQgQ@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][RFC] Mesa recipie now provides GL frontend libs
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
X-List-Received-Date: Mon, 16 Sep 2019 15:47:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/16/19 11:37 AM, Robert Nelson wrote:
> On Sat, Sep 14, 2019 at 8:52 AM Andrew F. Davis <afd@ti.com> wrote:
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>
>> Hello all,
>>
>> This is a preview change of our GPU driver stack. Mesa can now used to
>> provide the GL frontend libraries (EGL/GBM) for our SGX based systems.
>> This greatly expands our supported extensions and improves compatibility
>> with software designed to work with Mesa and Mesa provided tooling. The
>> existing backend is now confined to just a DRI backend used to provide
>> the GLES1/2 functions. The extensions/compatibility on this part of the
>> stack will not change.
>>
>> The Mesa-side-glue to interface with the SGX DRI blobs is currently
>> internal only until we can find the right way to distribute the patches
>> (recipe patches in meta-ti or as a fork of Mesa hosted on git.ti.com).
>> Currently they are on my internal only bitbucket, so those outside TI
>> will not be able to test just yet :( but can review this recipe patch
>> just the same.
> 
> Count me in! This looks awesome, we'd like these for BeagleBoard asap
> Pretty Please! ;)
> 

Can do! It's on it's way for all our supported SGX platforms, AM335x
included.

Andrew

> Regards,
> 

