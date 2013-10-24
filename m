Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A61ACE0175F
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 04:49:35 -0700 (PDT)
Received: by mail-vc0-f177.google.com with SMTP id ib11so1215234vcb.22
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=/wJHH/1pv65ltbeOQPlEwyFFcmQDq7+l7VouKzqWit4=;
	b=b02CVNMEExqDj7qBBFyxJWMQh7dVjnGrmUR0Mo7uizXOQNfGcduBGSjLksUmG2B58v
	c8nxLaVltVRza8zWNz49B+G+6iX7MptEEZ0gpdMD+XD2nDwMBK98Q0ypNPuv82wuz2Ry
	CKxj/RlZRY4xOboMXLV12EWpdLJ+rfnN/rAnuQllFru08XSh6W2vBZ+XkDwIrXTP/HNE
	DJTA5ppelienWdmi10bf3Pwzc6rMnIZvisZhQTfq90bC/kfW41qzYtdddQbiU4DPt2OW
	0T+CdjLbfdr2jxFslVfOZiN7+Z3AkXVKtqUXhs56+N3zTO3vQfZTjDPFOBsMl80hB1j9
	7Ztw==
MIME-Version: 1.0
X-Received: by 10.220.145.75 with SMTP id c11mr1180266vcv.30.1382615374245;
	Thu, 24 Oct 2013 04:49:34 -0700 (PDT)
Received: by 10.52.184.103 with HTTP; Thu, 24 Oct 2013 04:49:34 -0700 (PDT)
In-Reply-To: <5269031E.4040504@mlbassoc.com>
References: <1382606978-9914-1-git-send-email-schnitzeltony@googlemail.com>
	<5269031E.4040504@mlbassoc.com>
Date: Thu, 24 Oct 2013 13:49:34 +0200
Message-ID: <CALbNGRQHT73Zg4u+4b7sg8AONfxy--hsXoPejz2sY8pthX-T_Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] mesa appends: remove PROVIDES
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
X-List-Received-Date: Thu, 24 Oct 2013 11:49:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 1:23 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2013-10-24 03:29, Andreas M=C3=BCller wrote:
>>
>> These came in when mesa was reworked. Nowadays they are useless and what
>> they try to do achieve is wrong: provider for virtual/libgsl should be
>> mesa-gl. The appends were left in to avoid backward revision trouble in
>> package feeds.
>
>
> If this is the correct solution, I think these .bbappend files should be
> removed completely.  They don't change anything and keeping them just to
> retain the PRINC is useless because as is one cannot even build a system
> which uses virtual/mesa, e.g. one using the X11 server.  In addition, the
> main mesa recipe is about to be updated so they'll need changing again ve=
ry
> soon.
>
So let's kick them out as soon as mesa is updated

Andreas

