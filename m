Return-Path: <sledz@dresearch-fe.de>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89AA6E01423
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 23:59:18 -0700 (PDT)
Received: by eekb45 with SMTP id b45so2852259eek.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 23:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=vWQWUuV4UtEm+f4ehdho5DDxwx7C1niB7Ea9ldErCbc=;
	b=MNCh4EdIqcKL7oDGdGH7Jich0bMuCDIM0QATblognQyyYw6a57SIYqFas5262VHEqC
	xpb5uuR+pRBmnDfssG0iQD7HfaEnms48teaR0HuufiSYTshXVDjPZTmSthwd8afAEvPB
	ML8wrbuUyoYHJVSr82F4iev0zfSqnmqbFcblsI/+ADnNa9OP03magJzfg5ECqRh9OZZb
	9Z6Y78AGkT0HkKsjF4VeLsMKFx+zLahH87/XNAs5u0U/BgB/GYM75ccJPLaoKEyryvWY
	xo3a/FCQKX0JACLugG6b6yXT96NLvQwdoD4LnoVSJ8++WVdRjLlLMwVdfNPso/x8hvZK
	PoOQ==
Received: by 10.14.187.137 with SMTP id y9mr4827608eem.62.1340175557225;
	Tue, 19 Jun 2012 23:59:17 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPS id t3sm86099963eeb.15.2012.06.19.23.59.14
	(version=SSLv3 cipher=OTHER); Tue, 19 Jun 2012 23:59:15 -0700 (PDT)
Message-ID: <4FE174C1.7010601@dresearch-fe.de>
Date: Wed, 20 Jun 2012 08:59:13 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: Jason Kridner <jkridner@beagleboard.org>
References: <20120612011706.GD30300@denix.org>
	<CA+2YH7sCF75itqV6o-Oc-LeUnS5LwA67HpL1F-w9jgL_GMCDzw@mail.gmail.com>
	<4FDADD2B.7060508@dresearch-fe.de>
	<CA+T6QPkW5+rxRWsnmatAKgAhVJMQGtN_bYqRSLPCCOA8PJdjiw@mail.gmail.com>
In-Reply-To: <CA+T6QPkW5+rxRWsnmatAKgAhVJMQGtN_bYqRSLPCCOA8PJdjiw@mail.gmail.com>
X-Enigmail-Version: 1.4.2
X-Gm-Message-State: ALoCoQl5vqWEMsv7vzKr9L0w4ZeuTeeBwI3M/USCbLeIFFrNAfwcIidBc4e5SnPg4aeWB5RI9UGi
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 06:59:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2012 06:37, Jason Kridner wrote:
> On Fri, Jun 15, 2012 at 2:58 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> On 13.06.2012 16:15, Enrico wrote:
>>> ...
>>> So the question is: are there any plans in TI to properly support its
>>> platforms or will this continue to be a place where to drop some code,
>>> forget about it and then move it to an extra layer?
>>
>> It's really a great pity that there is no (official) response from TI to this . :(
> 
> TI has official support for BeagleBoard-xM and BeagleBone in Arago
> (currently based on OE Classic).  I feel, however, that we aren't
> doing enough to collaborate with community developers on these vendor
> kernels/BSPs, though we are starting to catch our stride on upstream
> contributions (TI is now the #2 semiconductor contributor to the Linux
> kernel per [1]).
> 
> Work will start in earnest in the next month to move this support to
> meta-ti.  The current proposal seems to be an attempt to clear-up
> responsibility and organization ahead of that effort.
> 
> [1] http://www.remword.com/kps_result/3.4_whole.html

Hi Jason,

thanx for this answer. Just a short question? I can't see if this is your personal view or an official TI statement?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

