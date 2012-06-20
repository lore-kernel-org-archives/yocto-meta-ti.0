Return-Path: <jkridner@beagleboard.org>
Received: from mail-gh0-f176.google.com (mail-gh0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90FC2E01423
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 21:37:59 -0700 (PDT)
Received: by ghbz10 with SMTP id z10so6183894ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 21:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=MPr+QVgz5oIWc7QG6Rxn32kxAfxTqa4Ccs7Cspg1qP4=;
	b=BgaVP8IpIu/a6L7j+64HjqCp/Fux+Dgvgu+vE/ZWsTv0DXeH83EgHFnR9YkOzljhQr
	6ZdRVxltjseD5XZeu/dBPmYDRJ1Sy+XfTvUhTQggH/6FPHTtMZnCvUkBvFKZzn3Wu3iu
	LXurPl9v+Yw66mZPwhilm4c3L8pj3mFCs6vgfUrum0alkc6zMcPniYAkDQ02jgGEci31
	/eTklzS1ErotCmQWlCflE68s5xYsi1pfu3+7RFpbtMGumo4x0aGKtjgYuMSilc42Z7iE
	s3STo3EiXuzXUR/EO8O96oPtRBFAkFB0imS7+pWMcGN7L2I3DtRnCh8qoH1qHc5cX6NQ
	rWzw==
Received: by 10.101.165.27 with SMTP id s27mr7895127ano.8.1340167078314;
	Tue, 19 Jun 2012 21:37:58 -0700 (PDT)
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mx.google.com with ESMTPS id p16sm38540031ano.19.2012.06.19.21.37.55
	(version=SSLv3 cipher=OTHER); Tue, 19 Jun 2012 21:37:56 -0700 (PDT)
Received: by obbwd18 with SMTP id wd18so9278055obb.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 21:37:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.113.1 with SMTP id iu1mr22737011obb.12.1340167075496; Tue,
	19 Jun 2012 21:37:55 -0700 (PDT)
Received: by 10.182.227.74 with HTTP; Tue, 19 Jun 2012 21:37:55 -0700 (PDT)
In-Reply-To: <4FDADD2B.7060508@dresearch-fe.de>
References: <20120612011706.GD30300@denix.org>
	<CA+2YH7sCF75itqV6o-Oc-LeUnS5LwA67HpL1F-w9jgL_GMCDzw@mail.gmail.com>
	<4FDADD2B.7060508@dresearch-fe.de>
Date: Wed, 20 Jun 2012 00:37:55 -0400
Message-ID: <CA+T6QPkW5+rxRWsnmatAKgAhVJMQGtN_bYqRSLPCCOA8PJdjiw@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Gm-Message-State: ALoCoQn5ioBzKlIPpeE9xYdJqAkALuN4pKxWFR7gSpNWOGazWJVEGP7SEgfy0CAH+835sY/FF5Z7
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
X-List-Received-Date: Wed, 20 Jun 2012 04:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 2:58 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> On 13.06.2012 16:15, Enrico wrote:
>> On Tue, Jun 12, 2012 at 3:17 AM, Denys Dmytriyenko <denis@denix.org> wro=
te:
>>> ....
>>> with the possibility of moving them back to "main" meta-ti in the
>>> future, once they become "first-class citizens", i.e. gain current and
>>> continuing support.
>>
>> What's the official TI plan for this? I mean:
>>
>> - what platforms is TI going to support? what platforms is TI going to
>> keep current?

BeagleBoard-xM and BeagleBone have support in the TI Linux SDK, are
getting patches applied in the mainline Linux kernel by TI developers
and will continue to be refreshed.  I'm sure other TI platforms may be
supported and given refreshes, but I'm only aware of the
BeagleBoard-related activities.

>>
>> - are there any plans to keep support for the dsp-related things?

The staffing on this is minimal, but there will be some refreshes in
the future.  Investment continues and can be clearly noted with things
like the availability of linux on C6000 in the mainline kernel now,
along with the requisite C6000 support in GCC.  I have some activities
planned for later this year to improve the DSP and M3/PRU
communications, but there are some more urgent issues to fix in the
mainline kernel relative to the processors on BeagleBoard,
BeagleBoard-xM and BeagleBone currently.

>>
>> I imported and fixed the dsp-related things from oe-classic, and Koen
>> was the only one that helped me.

Koen has been sponsored by TI in the past.

>>
>> I posted some patches for gst-ducati for omap4, with help from Koen
>> and Rob Clark, and nobody cared.

Rob Clark is a TI employee.  I appreciate your contributions.

>>
>> I know the concept of "opensource" and "community" but =A0it seems to me
>> that TI has no interest in all of this, just look at the current
>> platform support after the extras split.

Can we please stick to discussing where we can help, rather than
motivation?  I'm 100% confident that there is interest at TI for
supporting open source and community developers.  It isn't always at
the level I'd like, but it continues to grow overall and I think we
are being very open in this process.

>>
>> The point is that you will not stop people complaining (like Steffen
>> some days ago) just saying: "oh it's in extras you are lucky if it
>> builds".
>>
>> So the question is: are there any plans in TI to properly support its
>> platforms or will this continue to be a place where to drop some code,
>> forget about it and then move it to an extra layer?
>
> It's really a great pity that there is no (official) response from TI to =
this . :(

TI has official support for BeagleBoard-xM and BeagleBone in Arago
(currently based on OE Classic).  I feel, however, that we aren't
doing enough to collaborate with community developers on these vendor
kernels/BSPs, though we are starting to catch our stride on upstream
contributions (TI is now the #2 semiconductor contributor to the Linux
kernel per [1]).

Work will start in earnest in the next month to move this support to
meta-ti.  The current proposal seems to be an attempt to clear-up
responsibility and organization ahead of that effort.

[1] http://www.remword.com/kps_result/3.4_whole.html

>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

