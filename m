Return-Path: <flavio.alves@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFB0FE011ED
	for <meta-ti@yoctoproject.org>; Wed,  9 Jan 2013 11:27:35 -0800 (PST)
Received: by mail-ie0-f182.google.com with SMTP id s9so2578542iec.27
	for <meta-ti@yoctoproject.org>; Wed, 09 Jan 2013 11:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=wEtYAilcmgzFtEvNip9iWvD2yA5o7iYBEoNtVvdoMW4=;
	b=w3qikaLejWjsIhmJVvivl0goDwcH/s9OiWbLb9pB8ODp0JMt3x520rGoutt+7ofXrZ
	XR2+laxVX9gnmmkcdP1KbVXXa949k9uktTCTwmgMKYy1p5YnPOclyV7gT69t+r9Ax2wb
	VBTNQfbdw+VZrot/4cFy92FlwhBktN4gAUTj0UxIBJN3uZ+TMLpImXa1TrioFFXNEbOn
	SHMA+MiVCwrV8iEvhCdW+Oy5fHcivKUG9tu7V+M9D9IfW5URqVxfd/WoUB447aJvbsfz
	7/Es7aVq+D6A75gEbYKSHcMJC7AQ8IeIlxxaeP9WpIeNVoWI8JgSgsfHTQpGaASar+pl
	Bwiw==
MIME-Version: 1.0
X-Received: by 10.50.106.227 with SMTP id gx3mr2673261igb.10.1357759655321;
	Wed, 09 Jan 2013 11:27:35 -0800 (PST)
Received: by 10.42.24.202 with HTTP; Wed, 9 Jan 2013 11:27:35 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301090604340.4410@oneiric>
References: <CANmVirii6vJvYyAR-a6wOHjFwoSnpqk5vSipnkXQSU6rZPVmKA@mail.gmail.com>
	<CAOT3miLOCbazfMvaW8E2mV3o+uJwJYoU5GZ2PCRQXQ43qSwe6Q@mail.gmail.com>
	<alpine.DEB.2.02.1301090604340.4410@oneiric>
Date: Wed, 9 Jan 2013 17:27:35 -0200
Message-ID: <CAFNBftd=+st+VnYjP+Mg7CzHh5SHv7XYc3g0mi9pq5kpBKWEkQ@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Creating simple linux for beaglebone
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
X-List-Received-Date: Wed, 09 Jan 2013 19:27:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

I would suggest to exchange:

/home/prjs/video0001/linux/meta-openembedded/meta-oe  \

to

/home/prjs/video0001/linux/openembedded-core  \

Where you get this layer by doing:

git clone git://git.openembedded.org/openembedded-core -b danny

Best regards,

Flavio

2013/1/9 Robert P. J. Day <rpjday@crashcourse.ca>:
> On Wed, 9 Jan 2013, Nicolas Dechesne wrote:
>
>> On Wed, Jan 9, 2013 at 2:38 AM, Raul Rosetto Munoz <munoz0raul@gmail.com> wrote:
>> > Hello all,
>> >
>> > I want to create a simples linux for beaglebone using yocto danny.
>> >
>> > I did all the necessary clones:
>> > poky
>> > meta-ti
>> > meta-openembedded
>> >
>> > I changed all to danny branch!
>> >
>> > After these sets I did the poky source:
>> > source poky/oe-init-build-env beaglebone-linux
>> >
>> > Changed the machine to beaglebone
>> >
>> > MACHINE ?= "beaglebone"
>> >
>> > Changed the bblayer to:
>> >
>> > BBLAYERS ?= " \
>> >   /home/prjs/video0001/linux/poky/meta \
>> >   /home/prjs/video0001/linux/poky/meta-yocto \
>> >   /home/prjs/video0001/linux/poky/meta-yocto-bsp \
>> >   /home/prjs/video0001/linux/meta-ti \
>> >   /home/prjs/video0001/linux/meta-openembedded/meta-oe  \
>> >   "
>
>   did you really need to check out all those layers?  as i read it,
> the meta-ti layer has no dependencies on anything but basic OE --
> that's all i used for creating images for my pandaboard.
>
>   am i misreading something?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



-- 
Flavio de Castro Alves Filho

flavio.alves@gmail.com
www.linuxembarcado.com
Twitter: http://twitter.com/#!/fraviofii
LinkedIn profile: www.linkedin.com/in/flaviocastroalves

