Return-Path: <tasskjapp@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A841DE013AB
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 22:39:52 -0700 (PDT)
Received: by mail-la0-f49.google.com with SMTP id ev20so5316239lab.8
	for <meta-ti@yoctoproject.org>; Tue, 03 Sep 2013 22:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=V5ktgSA4l09wlkf3ssWbStk9yFmlqse1o88X0J0z+Ag=;
	b=CZTSMULRwiPcBiWGLph+2q50+5vf8/jioLUC9YDPnasrpT9grz+JYX5Qm59qqYRSG+
	k+V7WqsVAjdJw7HINixXwMJC72/W1cAJVVKPATOOxHkRt9VLSdVgMXDITpvWoP+UoOaW
	CUGChI3W1yEkuJsugVQ8pgcHSqp5Mssu2Spb45q+urWUH55iLymFC1qCLhdlQUAfi7sz
	BAEcs+rz/XA7OUn2E3gRgrzbwCqmKiiAPRvegjwQR97Z4eM5gqp0V93irWjbG0M0IPo8
	efmG2/OqTW3FIuModA/b5ga/rl0tJ6j9jqddIwD5aA41ds/ijDKYIgmK3qRhAsIGnCBO
	wknA==
X-Received: by 10.152.19.97 with SMTP id d1mr310101lae.34.1378273190680;
	Tue, 03 Sep 2013 22:39:50 -0700 (PDT)
Received: from [192.168.0.209] ([77.40.182.98])
	by mx.google.com with ESMTPSA id f17sm9704441lbo.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 22:39:49 -0700 (PDT)
Message-ID: <5226C7A4.3050203@gmail.com>
Date: Wed, 04 Sep 2013 07:39:48 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-5-git-send-email-denis@denix.org>
	<20130901031528.GA18322@edge> <52247F4E.6030404@gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C544A11@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C544A11@DFLE08.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version
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
X-List-Received-Date: Wed, 04 Sep 2013 05:39:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2013 07:29 PM, Cooper Jr., Franklin wrote:
>
>
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Tasslehoff Kjappfot
>> Sent: Monday, September 02, 2013 7:07 AM
>> To: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove
>> old 4.03.00.02 version
>>
>> On 09/01/2013 05:15 AM, Denys Dmytriyenko wrote:
>>> BTW, consider this an RFC for removing the next 4.05.00.03 version as
>>> well - I know some people are still using it, so please speak up.
>>>
>>
>> We're using 4.05.00.03 for our OMAP3530 board, because that is the latest one
>> we've tried that actually works :)
>>
>> Last time I tried newer versions there were "instant lockup" problems.
>> Are any of the newer versions compatible with OMAP3530 now?
> [Franklin] The Graphics SDK was validated on am3517  using a 2.6.37 kernel. I've successfully used 04.08.00.02 without any problems. What kernel version are you using?
>>
>> - Tasslehoff
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

We're using 2.6.39. When I had the issues I asked on #beagle, and among 
the responses was there currently was a problem with "instant lockup on 
omap3530 ES3.x", and that "hopefully the 1.7 based ddk will fix it". 
That was about a year ago. I'm not sure if what I tested on then was a 
4.08.x.x version.

- Tasslehoff

