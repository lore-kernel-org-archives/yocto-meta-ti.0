Return-Path: <jkridner@beagleboard.org>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A9CCE013A6
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 07:11:19 -0700 (PDT)
Received: by yenl5 with SMTP id l5so6052326yen.35
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 07:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=JKVWbpJdIIlHRw1MuFmLUz4apWWjKrCWchaJAWn+fks=;
	b=I6R5yA9KAbL5hEp9sAAv/2B1s8kUfNyPyOmtnMgyNjMwtuI5/5WqlUBIcPVUfL2FSC
	AGDBC06mTnQGfIjVXhdKDv2k3tux8OaQQjqzwHcBlIEVKJzLr5AxWdzzL+HtT7W2TxE3
	1mrmnKMlqwWhOrh35gwiX3/CphD5hxfAarfWMHMfh4V1GtACIn+kjN1Ugh/wlglFe8q4
	yC1Ud7V+hKLi0AzuOK71fAVbVX4I7/LB+FTvZRF4PPeCbV64WKWOmWJd9pv7+IZdSS7E
	ORKd2kspPoAWMZqLvLuXCSzFWZ+rbGw9UltR02H/n8OM4p5gOtuNcLX9I25JBrTjxTT5
	RWWA==
Received: by 10.236.115.36 with SMTP id d24mr27261888yhh.117.1340201478937;
	Wed, 20 Jun 2012 07:11:18 -0700 (PDT)
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mx.google.com with ESMTPS id p16sm40317877ano.19.2012.06.20.07.11.17
	(version=SSLv3 cipher=OTHER); Wed, 20 Jun 2012 07:11:17 -0700 (PDT)
Received: by obbwd18 with SMTP id wd18so10006032obb.35
	for <meta-ti@yoctoproject.org>; Wed, 20 Jun 2012 07:11:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.139.2 with SMTP id qu2mr23950847obb.34.1340201476895; Wed,
	20 Jun 2012 07:11:16 -0700 (PDT)
Received: by 10.182.227.74 with HTTP; Wed, 20 Jun 2012 07:11:16 -0700 (PDT)
In-Reply-To: <4FE174C1.7010601@dresearch-fe.de>
References: <20120612011706.GD30300@denix.org>
	<CA+2YH7sCF75itqV6o-Oc-LeUnS5LwA67HpL1F-w9jgL_GMCDzw@mail.gmail.com>
	<4FDADD2B.7060508@dresearch-fe.de>
	<CA+T6QPkW5+rxRWsnmatAKgAhVJMQGtN_bYqRSLPCCOA8PJdjiw@mail.gmail.com>
	<4FE174C1.7010601@dresearch-fe.de>
Date: Wed, 20 Jun 2012 10:11:16 -0400
Message-ID: <CA+T6QPn4OHrR_CXdOTPJBSV-SZt77yj+fJ0DJeDqut6eJkam4Q@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Gm-Message-State: ALoCoQngKLGX5dwXtUCL4mODIQRjbN3N1FcujddlipdVo81mKiRclGa9+/MbMEYnCcf4B55j5bKd
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
X-List-Received-Date: Wed, 20 Jun 2012 14:11:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 2:59 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> On 20.06.2012 06:37, Jason Kridner wrote:
>> On Fri, Jun 15, 2012 at 2:58 AM, Steffen Sledz <sledz@dresearch-fe.de> w=
rote:
>>> On 13.06.2012 16:15, Enrico wrote:
>>>> ...
>>>> So the question is: are there any plans in TI to properly support its
>>>> platforms or will this continue to be a place where to drop some code,
>>>> forget about it and then move it to an extra layer?
>>>
>>> It's really a great pity that there is no (official) response from TI t=
o this . :(
>>
>> TI has official support for BeagleBoard-xM and BeagleBone in Arago
>> (currently based on OE Classic). =A0I feel, however, that we aren't
>> doing enough to collaborate with community developers on these vendor
>> kernels/BSPs, though we are starting to catch our stride on upstream
>> contributions (TI is now the #2 semiconductor contributor to the Linux
>> kernel per [1]).
>>
>> Work will start in earnest in the next month to move this support to
>> meta-ti. =A0The current proposal seems to be an attempt to clear-up
>> responsibility and organization ahead of that effort.
>>
>> [1] http://www.remword.com/kps_result/3.4_whole.html
>
> Hi Jason,
>
> thanx for this answer. Just a short question? I can't see if this is your=
 personal view or an official TI statement?

It is my personal view based on knowledge of Sitara Linux SDK product
development plans.  Take a look at [2] for information on
collaboration with TI on SDKs and for BeagleBoard-xM and BeagleBone
support.

[2] http://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer=
%E2%80%99s_Guide

[This time hitting the reply-all button]

>
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058

