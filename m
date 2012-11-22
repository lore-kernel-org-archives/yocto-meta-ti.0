Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C940DE00533
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 06:42:32 -0800 (PST)
Received: by mail-vb0-f48.google.com with SMTP id l22so7658774vbn.35
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 06:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZBXvMgZTSpM1p9jYG2ZykWLnaaik7E1AttEk7H2xV24=;
	b=X/kQDX2goB0K80tvb//YHipHLl7ngBajYa7dRAqW+1FBwKwt34HXK2eeWyGP746KJ0
	JVmlz2uPh3cwcltQnnXuuRMRokeGf8XYiQJbuONvgHs6tgu6A0KutROIhquWGbdmcvpy
	X0jZgWXBQfAtqNp1V+Y88j1yF1TLIfNqErNuDD7SOhwxiQPJrto16QelpTrExPzpDBYy
	nX8e82qU2ulzVxINerkGtwoLj7jte6hY0adzn5Q8OxRkThYTNwbMUcrQHTWN33xJlAhD
	9EJJDe1yHdtV+SKXll09H0B1wzwtowIDmt7cSq3zu5EpVcr+9Z0A8VIax8a7VUEwFvyd
	vTBA==
Received: by 10.52.95.34 with SMTP id dh2mr966065vdb.69.1353595351779; Thu, 22
	Nov 2012 06:42:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Thu, 22 Nov 2012 06:42:11 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1211211440400.4010@oneiric>
References: <alpine.DEB.2.02.1211211440400.4010@oneiric>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 22 Nov 2012 15:42:11 +0100
Message-ID: <CAOT3mi+o650Z1sRA77FkXyoKJvFcNukC279vXriAc91gu1Eeig@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: quick online tutorial for building linux for pandaboard ES
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
X-List-Received-Date: Thu, 22 Nov 2012 14:42:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 21, 2012 at 8:43 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   nothing earth-shaking but i figured since i used OE and meta-ti to
> build a bootable system for my pandaboard ES, i might as well share:
>
> http://www.crashcourse.ca/wiki/index.php/OE-Core%2C_meta-ti_and_the_PandaBoard_ES
>
>   i'll probably mention this on the OE and yocto lists as well.

I believe you forgot to mention that you need to grab bitbake too here:

http://www.crashcourse.ca/wiki/index.php/OE-Core%2C_meta-ti_and_the_PandaBoard_ES#The_layers

alternatively, you could add a pointer to
http://www.openembedded.org/wiki/OE-Core_Standalone_Setup

