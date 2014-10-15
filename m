Return-Path: <scerveau@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8D25E00862; Wed, 15 Oct 2014 01:30:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (scerveau[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.212.177 listed in list.dnswl.org]
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F090AE007C1
	for <meta-ti@yoctoproject.org>; Wed, 15 Oct 2014 01:30:26 -0700 (PDT)
Received: by mail-wi0-f177.google.com with SMTP id fb4so1191409wid.4
	for <meta-ti@yoctoproject.org>; Wed, 15 Oct 2014 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=/f7JAFxSb0EoVToRV0UK64oQEJ+lxt/EX7P9w+Yf+44=;
	b=xJhl4izptYphCK6ar4nqi+y65iowcm+6zzaEApqT98Fd9b6x/0Z9Y0MJwIP46C9fcB
	7EHRO4/Pk2a+zkHMueRjBJMPGJHtmH1IFBt29wALMXUmmhq8/E82LHwLRD25aJFzc8vP
	SURMPSBpZNpGzFwHPlTh8B8zj10grrES9EusQwkHZ3Zthfi5zzuKDzegCUdJpttg8bx/
	2jefXCHKRJHkClZOyqfL3iTslQjssGaKbP+yxMWswjSe8VfWavS2qFVDE1kih5r+DOh4
	5Ya3P+rXOjMqVlRvFCmbq5HXaCDTRfFf5o6JdzqrcrAmVBFT4hwPuP1/v/sMM2mq/a8R
	e7ew==
X-Received: by 10.181.27.229 with SMTP id jj5mr10735071wid.64.1413361825625;
	Wed, 15 Oct 2014 01:30:25 -0700 (PDT)
Received: from [172.24.63.26]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id i1sm18444977wix.23.2014.10.15.01.30.24
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Oct 2014 01:30:25 -0700 (PDT)
Message-ID: <543E30A0.7090502@gmail.com>
Date: Wed, 15 Oct 2014 10:30:24 +0200
From: scerveau <scerveau@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Soundcard support
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
X-List-Received-Date: Wed, 15 Oct 2014 08:30:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone,

I build an image for beaglebone black with dora branch but i did not get 
any soundcard when i boot the board. How can i enable a soundcard with 
HDMI or with mcasp ?
Best regards.

Stéphane

