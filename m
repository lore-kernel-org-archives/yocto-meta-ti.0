Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0B8EE013A6
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2012 07:15:22 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so608816bkc.35
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2012 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LUAF+OtQ41XG8D1VsBIeAtL6L0XYyqvS5tY/L5dhCoI=;
	b=dTdxVMzWNwcaTtYOu9zDCsl91iLu++fh5Qe5YljWVGlQTGlF3RuxEaDEcaZdQchI36
	zPk1AYBn8pVowAUnKosbbOGTNOxeqL8otl+4WXehv10MwMXncgHYaSpO+7p1F/3nw45f
	gn1j3vZXeo+X6nS6gLHeVOsbJpnPUHQFElTCcI6UWH/2AxwWSv+G6Gi/EqLNdauazUqr
	aZlxQ610YaPc10iJQzRd6NFO1Zb5h+NIL++KXZkP63lfWyex9bYMEdGeFGIP5Lg5W9sK
	8RROm3Hgk+DxsaY7DCP3j+t12aMEqLa41IVZ9KjA0dYq2h8jfJZWJkms+jYcIGbIWOtn
	w4jw==
MIME-Version: 1.0
Received: by 10.204.151.130 with SMTP id c2mr13811737bkw.125.1339596921368;
	Wed, 13 Jun 2012 07:15:21 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.204.18.143 with HTTP; Wed, 13 Jun 2012 07:15:21 -0700 (PDT)
In-Reply-To: <20120612011706.GD30300@denix.org>
References: <20120612011706.GD30300@denix.org>
Date: Wed, 13 Jun 2012 16:15:21 +0200
X-Google-Sender-Auth: NWoP4HPfe7HnWPCAsCdB1i2p8Z0
Message-ID: <CA+2YH7sCF75itqV6o-Oc-LeUnS5LwA67HpL1F-w9jgL_GMCDzw@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Wed, 13 Jun 2012 14:15:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 12, 2012 at 3:17 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> ....
> with the possibility of moving them back to "main" meta-ti in the
> future, once they become "first-class citizens", i.e. gain current and
> continuing support.

What's the official TI plan for this? I mean:

- what platforms is TI going to support? what platforms is TI going to
keep current?

- are there any plans to keep support for the dsp-related things?

I imported and fixed the dsp-related things from oe-classic, and Koen
was the only one that helped me.

I posted some patches for gst-ducati for omap4, with help from Koen
and Rob Clark, and nobody cared.

I know the concept of "opensource" and "community" but  it seems to me
that TI has no interest in all of this, just look at the current
platform support after the extras split.

The point is that you will not stop people complaining (like Steffen
some days ago) just saying: "oh it's in extras you are lucky if it
builds".

So the question is: are there any plans in TI to properly support its
platforms or will this continue to be a place where to drop some code,
forget about it and then move it to an extra layer?

Enrico

