Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82E7BE00710
	for <meta-ti@yoctoproject.org>; Sun, 18 Nov 2012 04:06:50 -0800 (PST)
Received: by mail-vc0-f176.google.com with SMTP id fl13so5016348vcb.35
	for <meta-ti@yoctoproject.org>; Sun, 18 Nov 2012 04:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=CnAKWE2iDC/MIPDCaqthQO9Dv8PezBi9Y+HpBHzHyW8=;
	b=jKEFq90hlYQzK8rZ2l8HmNmATNqOLATPTdFqEW258J/YI5AXmS3GO8+QBMYdbdvDbF
	STCqnWVXJC899OVpDhXkLyxFKot9AiNhdqXIRgIbTJseXP+JAJoSb+U/JpupnnePFvXz
	UhnPYaHDqxVqpRaSRXFipRvxhoP84HtUS5qSxwuhlybYlqtdRKlITw4Ch6AYdQL2FirF
	JtppHMH/bMck6eq2OdbUlZ0uRD7vGtShlLFXrfg4j6H4SyaicUJUIjsR2Y0TMNPdiNB1
	bzZicF/Fm388YFLERatWf70kkN+0PJvO0Ih6gwHA6+AWoDGKAxWimQIuMhszkwRLimGy
	E9FA==
MIME-Version: 1.0
Received: by 10.58.145.161 with SMTP id sv1mr12814511veb.52.1353240409481;
	Sun, 18 Nov 2012 04:06:49 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.220.210.83 with HTTP; Sun, 18 Nov 2012 04:06:49 -0800 (PST)
In-Reply-To: <CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
Date: Sun, 18 Nov 2012 13:06:49 +0100
X-Google-Sender-Auth: 3VzFn1P-p2Ie0amj2_Juy_ZiEuE
Message-ID: <CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Cliff Brake <cliff.brake@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Sun, 18 Nov 2012 12:06:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 17, 2012 at 8:34 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> copying mail list ...
>
> On Sat, Nov 17, 2012 at 2:33 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>>
>> On Fri, Nov 16, 2012 at 7:05 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>>>
>>> On Fri, Nov 16, 2012 at 04:56:53PM -0500, Cliff Brake wrote:
>>> > I'm trying to boot a recent oe-core+meta-oe+meta-angstrom+meta-ti on a
>>> > pandaboard.  With 3.4, I get the attached.  With 3.1, I get the below:
>>>
>>> 3.4 should work. With 3.1 there were some reports that it didn't boot,
>>> when
>>> built with recent toolchain from oe-core... What problems do you have
>>> with
>>> 3.4? Does it boot?
>>
>>
>> I don't get to a log-in prompt:

From the boot log you attached it seems that the kernel hanged far
before the login prompt.

I can send you an uImage i'm using with a similar setup to test, the
only difference i can see is that i have a pandabord ES.

Enrico

