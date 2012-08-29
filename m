Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AF30E01346
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2012 00:43:37 -0700 (PDT)
Received: by wgx1 with SMTP id 1so153363wgx.11
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2012 00:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UwPP+srh+XIt4LRBm3RmjBuYhuKaFXJZVUTqsHJxGKk=;
	b=Ercurzr+IUDycJSkpwDNptaPG81TWePPBDvtNwWwavz8LsgUCRDH//4eFq6RxEl4Rm
	J7fkbxRFkeZXnllhaEGA5d6MeCQTVCirth7ypPDlZLNRiDzDSagD3+d1ZfMRAJpQ1NIW
	hXC417oixQ0dXHETsEw+NDJRonYfVghqo+ZXPSZKNbl9D1A9NnC4xcZV8FtaxK5wJ6Pu
	XW/9jNM2bamgFKTK3HAHJ0gSgUboV9PU88q7QFTSdDRhWvtBs5HMMW9fd7h63a94ufIb
	XGMMRe5ogiuBXoRDPpYLojHzRFfQuiGFej2+DWyjQpfJTnxEMwnFa4dyPKMsdvUPII50
	NqAw==
Received: by 10.216.138.92 with SMTP id z70mr421119wei.68.1346226215893;
	Wed, 29 Aug 2012 00:43:35 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id r9sm13740361wia.2.2012.08.29.00.43.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 00:43:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <503D3DFE.3020000@balister.org>
Date: Wed, 29 Aug 2012 09:43:33 +0200
Message-Id: <1FBDA2E9-068F-428D-B393-9F4F8A5D14C0@dominion.thruhere.net>
References: <CALjj03XPWGLXGAeDxJzg8_ap_ai=9=CnQwms5dujL7oNsmBkCw@mail.gmail.com>
	<503D3DFE.3020000@balister.org>
To: Philip Balister <philip@balister.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQl98+nKQxX9UJIjtMYhJgRajwBDfscdzALQSxqDfMVGPpWjaWQFaUdbmeLhB55y+ATlRqmm
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [Gumstix-users] Yocto and Wifi for Overo
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
X-List-Received-Date: Wed, 29 Aug 2012 07:43:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

My crystal ball is out for repairs currently, I can't deduce what is =
going wrong from the email you forwarded. My spare crystal ball does =
seem to say "README needs to be read", though.

Op 28 aug. 2012, om 23:54 heeft Philip Balister <philip@balister.org> =
het volgende geschreven:

> FYI.
>=20
>=20
> -------- Original Message --------
> Subject: Re: [Gumstix-users] Yocto and Wifi for Overo
> Date: Tue, 28 Aug 2012 17:11:56 -0400
> From: Sebasti=E1n Bas Kana <sbaskana@gmail.com>
> Reply-To: General mailing list for gumstix users. =
<gumstix-users@lists.sourceforge.net>
> To: General mailing list for gumstix users. =
<gumstix-users@lists.sourceforge.net>
>=20
> I used meta-gumstix and had to add meta-ti, but the latter has some =
issues
> with licensing checksums and broken dependencies, so I removed the
> conflicting files and had to build the core-image-minimal, as the =
"base"
> one fails to build the root filesystem.
>=20
> To enable WPA Wifi I followed what is explained on this thread:
>=20
> http://comments.gmane.org/gmane.linux.embedded.yocto.meta-ti/631
>=20
> Is there a cleaner way to do this? Why is meta-ti broken?
>=20
> Thank you for your help!
>=20
> Sebasti=E1n
>=20
> On Fri, Aug 24, 2012 at 4:48 PM, Andreas M=FCller <
> schnitzeltony@googlemail.com> wrote:
>=20
>> On Fri, Aug 24, 2012 at 5:27 PM, Sebasti=E1n Bas Kana =
<sbaskana@gmail.com>
>> wrote:
>> > Hi Guys,
>> >
>> > Has anyone been able to build a Wifi (WPA) enabled image for the =
overo
>> with
>> > Yocto?
>> >
>> > I keep getting errors when I try to configure wlan0. How can I get =
the
>> > drivers working?
>> >
>> > Thank you in advance!
>> >
>> > Sebasti=E1n
>> >
>> with meta-gumstix and networkmanager in image (e.g [1]) I have no
>> problem to connect my hidden WPA2 network and setup is easy.
>>=20
>> Andreas
>>=20
>> [1]
>> =
http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-=
image/xfce-base-image.bb
>>=20
>>=20
>> =
--------------------------------------------------------------------------=
----
>> Live Security Virtual Conference
>> Exclusive live event will cover all the ways today's security and
>> threat landscape has changed and how IT managers can respond. =
Discussions
>> will include endpoint security, mobile security and the latest in =
malware
>> threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
>> _______________________________________________
>> gumstix-users mailing list
>> gumstix-users@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>>=20
>=20
>=20
>=20
> <Attached Message Part.txt><Attached Message =
Part.txt>_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


