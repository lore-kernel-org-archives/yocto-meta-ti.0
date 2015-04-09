Return-Path: <twoerner@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC950E00957; Thu,  9 Apr 2015 06:03:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (twoerner[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB0A1E008EC
	for <meta-ti@yoctoproject.org>; Thu,  9 Apr 2015 06:03:04 -0700 (PDT)
Received: by igblo3 with SMTP id lo3so63749409igb.0
	for <meta-ti@yoctoproject.org>; Thu, 09 Apr 2015 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=W6WK7E2ynkud51YyKfboPzsp6ieEWk4TXN1JLM+CkPw=;
	b=bkEaIEaIilr3Rjm5GOpMPjQ1I/OOkHL0eavznoGWgo02GHUDWpXTduASkpdM5yAvMg
	ZCx5oZwmmjQpkiJtEQAnPrkJHoATFrwIuVOIO0gjIxNm1+R/Elu3HfpjF35Nx8YSJPcl
	ZK5+zoSjNqjkTM6N76cTWW+J/PY2FbrbGlfZJOvSfaFA0vmoRhQp6RxHRlgxDu8YR5t+
	/XkiBro1Os1xAHPfslxevoOhWH1M7SoMsJzjU0lziVpU1/CV/Rvefglz0bWPYuuJ0Xjn
	+M2Q3u23vXKaTpmpHCpmN/hKDZ0zRn73VgCpCmtgIYv+Z5EwqvzZ4n14SqwvkqlvGZ/B
	RyIQ==
X-Received: by 10.50.178.133 with SMTP id cy5mr19239768igc.5.1428584584206;
	Thu, 09 Apr 2015 06:03:04 -0700 (PDT)
Received: from [192.168.141.83] (dsl-67-204-51-13.acanac.net. [67.204.51.13])
	by mx.google.com with ESMTPSA id
	r39sm8679901ioi.2.2015.04.09.06.03.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 06:03:03 -0700 (PDT)
Message-ID: <55267887.80001@gmail.com>
Date: Thu, 09 Apr 2015 09:03:03 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <5525A37A.70503@gmail.com>
	<CAMKF1soSt+BSYq4d8EJnn=S43W3fq3yR-9kGauxqcG8GP_37CA@mail.gmail.com>
In-Reply-To: <CAMKF1soSt+BSYq4d8EJnn=S43W3fq3yR-9kGauxqcG8GP_37CA@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: dizzy branch
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
X-List-Received-Date: Thu, 09 Apr 2015 13:03:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-08 07:14 PM, Khem Raj wrote:
> On Wed, Apr 8, 2015 at 2:54 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> Is there going to be a dizzy branch to meta-ti?
> is some change in OE-core master asking for it ?

I thought it was traditional to "draw a line in the sand" and say "when 
dizzy was released, this is how this layer looked".

Having a branch named dizzy, I think, would make it easier to base work 
on a given release. Let's say you release a product based on dizzy and a 
year from now you want to perform a fresh build on a new machine for 
your product. Clone all the required repositories and then checkout the 
dizzy branch in all of them?

Also, sometimes nobody notices that a change will affect a given release 
until months later. So although nothing is obviously asking for it, 
maybe some changes are causing issues we won't notice until months from now?

