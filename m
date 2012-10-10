Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0605EE00348
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 07:28:39 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so511355vbm.35
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=RDphuWxzATyRuo+xFwFyBAgESzccTzVhNbOmU8Vbjrg=;
	b=rA/9SXVf24h2MYWCFZ1ooD77Qh0GTakuIC2CsYsaiiWzMS5WxB4WUsauvU/sXL7vfe
	GKkhQHSKpYHWWHRaYVth8cn2GLLsHLFDUHx+msIlyJDjIskOqzEj9Xx5nrRUprtwEjq/
	TeH2temp78a5UHwQjnRZp2rdhp/SVgMSvzWN1zTxa/nHNOxL1bBJleAw7fM9JkNlvstF
	nZV0TC7v8sPY49bQ240zkMpSpncdWozsbIYKTvsa0i95WtzCR88DY1Q6r3HY4lG9+4zH
	XFFFBBbo37/6cAZIuWv0QMKjl4dQVCFZ6NgSnk6Yh0RXws28KLiUh7L1Wa7iA2eetenj
	XdZA==
MIME-Version: 1.0
Received: by 10.220.150.16 with SMTP id w16mr13786927vcv.65.1349879317122;
	Wed, 10 Oct 2012 07:28:37 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Wed, 10 Oct 2012 07:28:37 -0700 (PDT)
In-Reply-To: <CAOT3miL7oXiPiP+ohUHcZnvo=tLhVpiQYDSTgvE+YmXk52e=WA@mail.gmail.com>
References: <CA+2YH7t+V==z2+Amb=GOeLneT-ZrxtmS10RJBEwn4gLSndOv_w@mail.gmail.com>
	<CAOT3miL7oXiPiP+ohUHcZnvo=tLhVpiQYDSTgvE+YmXk52e=WA@mail.gmail.com>
Date: Wed, 10 Oct 2012 16:28:37 +0200
X-Google-Sender-Auth: f_cZIT4MOxIG2w3E53kHKncQP48
Message-ID: <CA+2YH7tW-Tv9xb6kEA23XA=VtvOuyBPaU5ATHQvX562uuGKyTQ@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Nicolas Dechesne <ndec13@gmail.com>
Cc: meta-ti@yoctoproject.org, rob@ti.com
Subject: Re: gst-ducati...again
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
X-List-Received-Date: Wed, 10 Oct 2012 14:28:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 10, 2012 at 12:17 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> On Wed, Oct 10, 2012 at 11:23 AM, Enrico <ebutera@users.sourceforge.net> wrote:
>> i have a working setup, tested on angstrom master (downloaded ~ a week
>> ago) console-only, with gst-ducati h264/mpeg4 encoding working. I
>> tested it with videotestsrc (1080p 30fps) and a 1080p webcam (2 fps)
>> too with default settings.
>>
>> I've used the prebuilt ipu firmware from [1] but i noticed that
>> sometimes older files can get deleted from there. Before sending
>> recipes for review, do someone know if those firmware files can be
>> mirrored somewhere or is it a license violation?
>
> yes, on Launchpad PPA, a new package version upload removes the
> previous version... it's a feature ;-)
>
> you can mirror them somewhere else, there is no problem (note: I am
> one of the admin of the tiomap-dev PPA...), i am sure it's beeing
> mirror'd in other places already (like in Linaro PPA for example, and
> Linaro releases, ...)
>
> I am quite interested to see your recipes ... we are starting some
> yocto/poky recipes as well here...

A yocto mirror could be good :D

Seriously, if someone knows a mirror where those files are not deleted
please tell.

I'll cleanup and send the recipes for review later today/tomorrow.

Enrico

