Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 061FCE0059A
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2012 13:21:19 -0700 (PDT)
Received: by wgbdq13 with SMTP id dq13so1939153wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2012 13:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=qF4NsuB4VEqQPwgksHexZVKXv3a3ZA9eyRViTkWoz10=;
	b=PGu78435kBbUZNhj8EuebmAr72QZxca08N3RxOKpJZITbLkGsR078koBqp8SfqG6TT
	qDfHds9p0mTpvFqyzmC7c2z1MEJKmsngVm+pXWY1Sl31pRXRK2XpJU6AjjnOiHOFXDrL
	X97ucnGc3SikSyY9ETeXZoLEYVQw+1j73L8ZPsLrCM7MzchIzWFHyiTZUwAs9itSJDH1
	VzAP0I0M1e3FLr1qdLAWTQrDAEC0UUoeas3F+W3rzEldcdtmSRb5X0Nj5Jjp3aq/l5xn
	BJFRwDtanJDDWsetl2ovzYFYKR7MXg1Op1ZlkPOzpe23jWbdQN/l8cXMYMUEaLYIjcpM
	SE7w==
Received: by 10.180.95.37 with SMTP id dh5mr18764794wib.8.1334262078564;
	Thu, 12 Apr 2012 13:21:18 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j3sm25217082wiw.1.2012.04.12.13.21.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 13:21:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120412200941.GF13291@denix.org>
Date: Thu, 12 Apr 2012 22:21:14 +0200
Message-Id: <EB812FEE-EE00-4932-AF14-232F200EECD9@dominion.thruhere.net>
References: <1334063340-21063-1-git-send-email-koen@dominion.thruhere.net>
	<20120412200941.GF13291@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnD1uJDJeHKW+pVnHK7Uo0P3MEs9QPjQuaeWWyrHuS4IaNFqbTsfRKDOhT0tHxFVBrrgcre
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] am33x-cm3: add firmware for am33x suspend/resume
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
X-List-Received-Date: Thu, 12 Apr 2012 20:21:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 22:09 heeft Denys Dmytriyenko het volgende =
geschreven:

> Koen,
>=20
> I'm commenting on both of your patches together...
>=20
> am33x-cm3:
>> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
>>=20
>> +do_install() {
>> +	install -d ${D}${base_libdir}/firmware
>> +	install -m 0644 bin/am335x-pm-firmware.bin =
${D}${base_libdir}/firmware/
>> +}
>=20
>=20
> linux-ti33x-psp:
>> This fixes most PM operations: cpufreq, cpuidle and suspend. Resume =
does not=20
>> work on beaglebone, but 3 out of 4 ain't bad :)
>>=20
>> The M3 firmware needed for suspend/resume is used as a binary, =
building it=20
>> from source and including it from sysroots is planned for future =
commits.
>>=20
>> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>>=20
>> +do_compile_prepend() {
>> +       cp ${WORKDIR}/am335x-pm-firmware.bin ${S}/firmware/
>> +}
>=20
>=20
> Have you looked at how it's done in Arago/AM-SDK?

No, I only looked at meta-ti :)

> The firmware is staged in=20
> the sysroots and gets picked up by the kernel:
>=20
> do_install() {
>    install -d ${STAGING_FIRMWARE_DIR}/am33x-cm3
>    install ${S}/bin/am335x-pm-firmware.bin =
{STAGING_FIRMWARE_DIR}/am33x-cm3/
> }
>=20
> Where the kernel then copies it to ${S}/firmware:
>=20
> # Copy the am33x-cm3 firmware if it is available
> do_compile_prepend() {
>    if [ -e "${STAGING_FIRMWARE_DIR}/am33x-cm3/am335x-pm-firmware.bin" =
]
>    then
>        cp "${STAGING_FIRMWARE_DIR}/am33x-cm3/am335x-pm-firmware.bin" =
${S}/firmware"
>    fi
> }
>=20
> It's not the most elegant solution either, but at least it gets around =
the=20
> need to keep the binary version of the firmware in the repository with =
the=20
> kernel recipe...
>=20
> Do you want me to make similar changes to your patches? Or do you have =
any=20
> arguments against this approach?

Yes, you're not allowed to touch sysroots from inside do_install since =
that will break sstate, which is why I added regular recipes first to =
get it working and fix it properly later.

It's a bit academic at this point, since you need to get lucky in the =
silicon bingo to have suspend/resume working on am335x anyway. I can =
disable CONFIG_SUSPEND and remove the copying bits if you want.

regards,

Koen=

