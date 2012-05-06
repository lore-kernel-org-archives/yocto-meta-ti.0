Return-Path: <ebutera@gmail.com>
Received: from mail-vx0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AC4DE0059A
	for <meta-ti@yoctoproject.org>; Sun,  6 May 2012 07:17:07 -0700 (PDT)
Received: by vcbf1 with SMTP id f1so2440373vcb.35
	for <meta-ti@yoctoproject.org>; Sun, 06 May 2012 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=GU0/vn79AjCHPJZzG/kmvNowiMT7GaXP5QRpuzBAQI4=;
	b=AYbjirtbwFL1qHhX6l5Mk711bmih6vk2zIz7OdEp84drLvl7w4g0pvrt9/bMSlWKCf
	cQS+pPEd9RUcXTbjyjV3nlPNrTdWSOwXLZP1SOS/fKpR+JKqAZdBr1ZSeXBrahX5lrwQ
	yam+IZXSMyzDA+PCjy5bHAlF8TZi7oFWS4mTtFrcAH9Yi22t9K03jpdkPSEkSeRRs4iA
	YZYBNS/JN5OvylHi13xl/TKMgT7GByHSw6zKWXpxyjbnsajJMKLwmT3YC/4hnvktx2y/
	d1npG+Bzt0aSfv1PgVkN/mvu43/9lmeZPYvK7ueE0RuPhgDreHwqhgndMLrk+8QASu6P
	0qWQ==
MIME-Version: 1.0
Received: by 10.220.39.197 with SMTP id h5mr3828947vce.51.1336313826347; Sun,
	06 May 2012 07:17:06 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.148.68 with HTTP; Sun, 6 May 2012 07:17:06 -0700 (PDT)
In-Reply-To: <CABcw_OnmrqyWeQszZL5duTdtfM39o+x_CWayeuuogEaPi=ohMA@mail.gmail.com>
References: <CA+2YH7srjOf900PBFzxVx8Tm4HKaxuvKzKudoo201Bh7-48o6g@mail.gmail.com>
	<CABcw_OnmrqyWeQszZL5duTdtfM39o+x_CWayeuuogEaPi=ohMA@mail.gmail.com>
Date: Sun, 6 May 2012 16:17:06 +0200
X-Google-Sender-Auth: CqrwNsNHoWPHZ3YTxe9e2g00FNE
Message-ID: <CA+2YH7v2xZxACdG=PVb0EELAEq7ykJySJnjMOWiZFiSLoj=Dbg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: whittenburg@gmail.com
Cc: meta-ti@yoctoproject.org
Subject: Re: ti-dsplink build error
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
X-List-Received-Date: Sun, 06 May 2012 14:17:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 6, 2012 at 5:11 AM, Chris Whittenburg <whittenburg@gmail.com> wrote:
> I am having the same problem, on a ubuntu 11.10 64bit host, and adding
>
> INHIBIT_PACKAGE_STRIP = '1'
>
> to my angstrom-v2012.05.conf file allowed it to complete.

Yes, i needed that for other meta-ti packages too (linux-utils,
local-power-manager...). But i don't know what's the proper fix (i.e.
what's the problem in package.bbclass).

Enrico

