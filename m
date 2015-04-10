Return-Path: <twoerner@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 314BAE009AF; Fri, 10 Apr 2015 11:33:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (twoerner[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.171 listed in list.dnswl.org]
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85BF8E009A1
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 11:33:52 -0700 (PDT)
Received: by iejt8 with SMTP id t8so24273474iej.2
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 11:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+kQjkrsapRz3bVLtaaTIuDCb9LZon604MkTs7J6c2+w=;
	b=GnS+BvUrrhEk34K+IUGpe0pbZsnuOaCNT1FxSH7pEYWn4GXpZMJL6OuSvPLPgEjAZ6
	stUrmueFmDRCQm6SFLwo1fYBMVfJiDy7eyYquxIZ2ru9RMIgDE0iBR2JtI5rb5iFKprg
	/BsW7Yb2H45XbWzS0wj42Fbzgqd//sCOnNnuuRzb5x7GgtMp0nW8pNppsVWWQrKnalGt
	1bQZphH0Fx4jrptuUlgTf9ioTpckydeOwpORvu5mjeO4QRbH9b5OGmjkGQLuNizKw09Z
	jpL7LyBk362MlUHYCjgzL11oHPjo4lR8euJfUU4QadAVeYR7Kav3goY81scGWq2rT3ds
	vXWA==
X-Received: by 10.107.135.144 with SMTP id r16mr4936560ioi.13.1428690832565;
	Fri, 10 Apr 2015 11:33:52 -0700 (PDT)
Received: from [192.168.34.210] (static-66-11-92-234.ptr.terago.net.
	[66.11.92.234])
	by mx.google.com with ESMTPSA id ij7sm284692igb.18.2015.04.10.11.33.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 11:33:52 -0700 (PDT)
Message-ID: <5528178F.7040502@gmail.com>
Date: Fri, 10 Apr 2015 14:33:51 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <5525A37A.70503@gmail.com>
	<CAMKF1soSt+BSYq4d8EJnn=S43W3fq3yR-9kGauxqcG8GP_37CA@mail.gmail.com>
	<55267887.80001@gmail.com> <20150409215736.GE6414@edge>
In-Reply-To: <20150409215736.GE6414@edge>
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
X-List-Received-Date: Fri, 10 Apr 2015 18:33:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-09 05:57 PM, Denys Dmytriyenko wrote:
> BTW, we plan to migrate our products to Fido in the near future, so 
> basically we are tracking Spring Yocto releases - Denzil, Dylan, 
> Daisy, Fido, etc. So, there will be fido branch at some point and I 
> will stop accepting new features into daisy... 

Great, thanks for the explanation!

