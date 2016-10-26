Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF1F7E00D00; Tue, 25 Oct 2016 21:15:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.176 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DC73E00CF5
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 21:15:49 -0700 (PDT)
Received: by mail-ua0-f176.google.com with SMTP id b35so92768uaa.4
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 21:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=89ivvBlyrCj1ISZt6juZA6qjL4iCLxqQUmdMK3B3ZlE=;
	b=Tj5uLGLPByY8T+30ckwOlHz0X9SnC+BUJvK0sw3DT8TUPwr2DQK9r8TGYJExI6BJpJ
	6qlWNgbUXGP8HT1QBmBObPUgb6l465HQS+bedymIrkFyyvv6F6i9ai5I2RnyFZABbDKu
	bB1/IFagz5PQHuH0JG+VcoWaQzay4ieD1ehSZItnFHxVjZ48Jr09D+Qgxe7J7s9UtBJs
	GbGpcBR8Skw92TZRwIGnK1yZcGAUzuCUq3l5DIOqTD/vVP6BHcGs0ewD7kgrjwFr/S7F
	nUZ9jTQ7CQ6wyM1F3ZUIBMgOPI3BKah3ImyhvkTzl/VeZ68aZrqMAu/Q20PQGOJN93qK
	pucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=89ivvBlyrCj1ISZt6juZA6qjL4iCLxqQUmdMK3B3ZlE=;
	b=e3vh5NxSkRcd1cizXCg+NRjvt48zddJICl5JULerr7YXRoTsAzxIlRwPZyOrpljkfo
	qZMHudvqHW1HfPrS8VxAQwVR6Lse6c20Xg7U4wbzZBLhWn1ZO/9Mqqy7y6Psq5QFlEt2
	cERXu52lJHwhUvdzBMYRL69ARZ4TX9qcQ3mbFvdPXmZAKARuNCET6vriNhLSEJmvfI0b
	tjzI5xnJKhP07WMmUNDi5PRRnSNX6enbfBOcFgrRp/5+yFwIjnxJ+seDoDlVUz2pNtwT
	krUc17M9cJR+y4Um5mZXEEHgtaf2qyVczjFL9k9D47bc6K8Zt+JM53hiWfzn30E+iOpI
	Pn6Q==
X-Gm-Message-State: ABUngveEkP5wOMe7wjIGEPTMrnkWPq1dOL7De6rXdL+oOZxrF8LAhA0ugwxgiEPd2oqN8biSTR3T+20dh2rG7g==
X-Received: by 10.159.38.135 with SMTP id 7mr3656880uay.138.1477455349282;
	Tue, 25 Oct 2016 21:15:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Tue, 25 Oct 2016 21:15:18 -0700 (PDT)
In-Reply-To: <20161026030639.GY12745@edge>
References: <20161026000857.10015-1-raj.khem@gmail.com>
	<20161026030639.GY12745@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Oct 2016 21:15:18 -0700
Message-ID: <CAMKF1sr3g-mbqO7Tn5tvBomdB0NJeyeziALWhes5k=jS7iju6A@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-unpack.inc: Use absolute paths in require directive
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
X-List-Received-Date: Wed, 26 Oct 2016 04:15:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 25, 2016 at 8:06 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Tue, Oct 25, 2016 at 05:08:57PM -0700, Khem Raj wrote:
>> This helps in using this inc file from other BSP
>> layers which are dependent on meta-ti
>
> I'll take it for master. Do you need it in krogoth?

yes krogoth too plz

>
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-ti/includes/ti-eula-unpack.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
>> index 912cd18..ead0610 100644
>> --- a/recipes-ti/includes/ti-eula-unpack.inc
>> +++ b/recipes-ti/includes/ti-eula-unpack.inc
>> @@ -9,7 +9,7 @@
>>  #  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user wants to put
>>  #                       the output in some internal directory
>>
>> -require ../includes/ti-unpack.inc
>> +require recipes-ti/includes/ti-unpack.inc
>>
>>  TI_BIN_UNPK_ARGS = "--mode console"
>>
>> --
>> 2.10.1
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

