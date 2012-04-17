Return-Path: <koen@beagleboard.org>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED8C7E0044A
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 00:49:07 -0700 (PDT)
Received: by werc1 with SMTP id c1so5177126wer.35
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 00:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Bpr48h0mQoIgY0W3o0U/MzlE1DB2GszmBVJx8bPa1wU=;
	b=SaehUK4zWRAJ7dHlODvvDJn9iOQ6Z7jpH+z077RijYuv8w75RMLJlhTsoVrS0c+YHq
	+jvsaG89kEWmvrLpoBAjuWMcFPTZkqzAohOvToS04LTCzBCRx/6lAZWPI3MkS2uovKEa
	+YzXISxvxt7+C+McYlMD/MMmlRHsSuvgke68kLwvxIaY56qv0fboqfhFehmURSmePcKT
	Ip0u5VLJCr8DsYMHH/m5889y4y/lWdQAvDZc/xZD1h4N9D79W4JN1/aqVbtgZn3zvO2B
	JJ5G+n+6l6gALQ/phx4vV1CxsOqjInnm60GrKkJIOcwuy6TpHWpP4929gPnGf2yWmsaN
	xKpQ==
Received: by 10.216.131.34 with SMTP id l34mr8495366wei.54.1334648946906;
	Tue, 17 Apr 2012 00:49:06 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm25162645wib.6.2012.04.17.00.49.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 00:49:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <EB812FEE-EE00-4932-AF14-232F200EECD9@dominion.thruhere.net>
Date: Tue, 17 Apr 2012 09:49:07 +0200
Message-Id: <91400C8F-EED9-4BD1-93CB-709312080A49@beagleboard.org>
References: <1334063340-21063-1-git-send-email-koen@dominion.thruhere.net>
	<20120412200941.GF13291@denix.org>
	<EB812FEE-EE00-4932-AF14-232F200EECD9@dominion.thruhere.net>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlzhgVQiDieNjBTlo+JVbMgW5Yk1gxDel9pcN4UFtLsOAfFphEmsBBX+/zh4igpvna9vvMN
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
X-List-Received-Date: Tue, 17 Apr 2012 07:49:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 22:21 heeft Koen Kooi het volgende geschreven:

>=20
> Op 12 apr. 2012, om 22:09 heeft Denys Dmytriyenko het volgende =
geschreven:
>=20
>> Koen,
>>=20
>> I'm commenting on both of your patches together...
>>=20
>> am33x-cm3:
>>> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
>>>=20
>>> +do_install() {
>>> +	install -d ${D}${base_libdir}/firmware
>>> +	install -m 0644 bin/am335x-pm-firmware.bin =
${D}${base_libdir}/firmware/
>>> +}
>>=20
>>=20
>> linux-ti33x-psp:
>>> This fixes most PM operations: cpufreq, cpuidle and suspend. Resume =
does not=20
>>> work on beaglebone, but 3 out of 4 ain't bad :)
>>>=20
>>> The M3 firmware needed for suspend/resume is used as a binary, =
building it=20
>>> from source and including it from sysroots is planned for future =
commits.
>>>=20
>>> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>>>=20
>>> +do_compile_prepend() {
>>> +       cp ${WORKDIR}/am335x-pm-firmware.bin ${S}/firmware/
>>> +}
>>=20
>>=20
>> Have you looked at how it's done in Arago/AM-SDK?
>=20
> No, I only looked at meta-ti :)
>=20
>> The firmware is staged in=20
>> the sysroots and gets picked up by the kernel:
>>=20
>> do_install() {
>>   install -d ${STAGING_FIRMWARE_DIR}/am33x-cm3
>>   install ${S}/bin/am335x-pm-firmware.bin =
{STAGING_FIRMWARE_DIR}/am33x-cm3/
>> }
>>=20
>> Where the kernel then copies it to ${S}/firmware:
>>=20
>> # Copy the am33x-cm3 firmware if it is available
>> do_compile_prepend() {
>>   if [ -e "${STAGING_FIRMWARE_DIR}/am33x-cm3/am335x-pm-firmware.bin" =
]
>>   then
>>       cp "${STAGING_FIRMWARE_DIR}/am33x-cm3/am335x-pm-firmware.bin" =
${S}/firmware"
>>   fi
>> }
>>=20
>> It's not the most elegant solution either, but at least it gets =
around the=20
>> need to keep the binary version of the firmware in the repository =
with the=20
>> kernel recipe...
>>=20
>> Do you want me to make similar changes to your patches? Or do you =
have any=20
>> arguments against this approach?
>=20
> Yes, you're not allowed to touch sysroots from inside do_install since =
that will break sstate, which is why I added regular recipes first to =
get it working and fix it properly later.
>=20
> It's a bit academic at this point, since you need to get lucky in the =
silicon bingo to have suspend/resume working on am335x anyway. I can =
disable CONFIG_SUSPEND and remove the copying bits if you want.

ping=

