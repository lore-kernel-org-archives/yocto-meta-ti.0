Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C780E00837; Wed,  8 Apr 2015 16:15:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.174 listed in list.dnswl.org]
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40D69E003A8
	for <meta-ti@yoctoproject.org>; Wed,  8 Apr 2015 16:14:57 -0700 (PDT)
Received: by iedfl3 with SMTP id fl3so98733047ied.1
	for <meta-ti@yoctoproject.org>; Wed, 08 Apr 2015 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NwKhYU7qVn+n3E2gyQIPmI4VJDwZU9fsYsl/vQC3X1s=;
	b=EWkJwEbiUcMtdv/tAOoqPJubSVNE13Ge6JUKm+56d/1Por9HZ2Stab3RDI6X3sbTxX
	KRiCFQL9uZhvgQ8Aaf0zaovVBnuk9Il093lJT8zsmOcePqeCdRo408Wr8wSOpxETYWgf
	DcjWU5XoWTADe561IrvrgQ/sdCl7ox3qhOCB3oS6PQNAtJua9t1mThvxK3j2X1xIlUPU
	Jp0jYzUQVJkfT6Utcu97iuKoTi0fg32FI9qaBQl4xQtuxzxrlo8vC2Q5zRWypqjdPZiH
	axof3Z8bLMfcTeaDlh4J9L3XCSzsED55AboSnRoAGBaasZrNLROcY3PjvH/4qX0Edw66
	LkuA==
X-Received: by 10.50.36.104 with SMTP id p8mr15839926igj.16.1428534897209;
	Wed, 08 Apr 2015 16:14:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Wed, 8 Apr 2015 16:14:27 -0700 (PDT)
In-Reply-To: <5525A37A.70503@gmail.com>
References: <5525A37A.70503@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Apr 2015 16:14:27 -0700
Message-ID: <CAMKF1soSt+BSYq4d8EJnn=S43W3fq3yR-9kGauxqcG8GP_37CA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
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
X-List-Received-Date: Wed, 08 Apr 2015 23:15:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 8, 2015 at 2:54 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Is there going to be a dizzy branch to meta-ti?

is some change in OE-core master asking for it ?

