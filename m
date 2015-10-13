Return-Path: <joshua.vanderpool@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8ABDE00D99; Tue, 13 Oct 2015 07:37:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: *  1.0 HK_RANDOM_FROM From username looks random
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (jdvdt2[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68848E006F6
	for <meta-ti@yoctoproject.org>; Tue, 13 Oct 2015 07:37:02 -0700 (PDT)
Received: by ioii196 with SMTP id i196so22885116ioi.3
	for <meta-ti@yoctoproject.org>; Tue, 13 Oct 2015 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=rG6Bia4xo4F3+0zbHT3h3CIGl8nQjl3eeUzmPru3P7k=;
	b=L0hGtDTzsyiA6RtwkuhUIsurW1XKGdOoakMRaELzgWPOzDpq7cPnpthCf2VojLbpQ6
	USnp55neFH9NXtBynGc78Yo3/0moOddfoYGG18u0YtN1q8fungsiqrDyQ/o0XAqivnu3
	qQox5kGP3W3prjBhqosWzTqoHvM2v+Derujxu2PoCrmZxbFUg7bWzsUsAzvbJbpc7HS1
	xZdRjbcAVRo76qqhfSYA0DoPBZJY7omxdOfVDEtSxqXbKXcYM0/vF26VyjD0/44TM+P9
	HyD19Ly6+otrfopungbBMHDLHo+mNrtyPyhRHODpOTRX8zvF/JhjTTtwdo04m7wcfJie
	JBRQ==
MIME-Version: 1.0
X-Received: by 10.107.46.228 with SMTP id u97mr33322791iou.165.1444747022120; 
	Tue, 13 Oct 2015 07:37:02 -0700 (PDT)
Sender: joshua.vanderpool@gmail.com
Received: by 10.65.14.197 with HTTP; Tue, 13 Oct 2015 07:37:02 -0700 (PDT)
Received: by 10.65.14.197 with HTTP; Tue, 13 Oct 2015 07:37:02 -0700 (PDT)
Date: Tue, 13 Oct 2015 10:37:02 -0400
X-Google-Sender-Auth: VFIXp6q96CWpp3o7mlV7DYrju9Q
Message-ID: <CAOYMvD3xiJ+r94P5TPDx5y6kAK+LY60Zu2KyHSFJPMZcWxq0JA@mail.gmail.com>
From: Joshua Vanderpool <jdVdt2@gmail.com>
To: meta-ti@yoctoproject.org
Subject: U-boot with TPS659037
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
X-List-Received-Date: Tue, 13 Oct 2015 14:37:06 -0000
Content-Type: multipart/alternative; boundary=001a11c15b500b453a0521fd6175

--001a11c15b500b453a0521fd6175
Content-Type: text/plain; charset=UTF-8

This is based of the beagleboard_X15 board.c

The write to the PMIC to hold power on is limited to a 8 bit address and
the new PMIC has a longer address.

int board_late_init(void)

{

init_sata(0);

/*

 * DEV_CTRL.DEV_ON = 1 please - else palmas switches off in 8 seconds

 * This is the POWERHOLD-in-Low behavior.

 */

palmas_i2c_write_u8(TPS65903X_CHIP_P1, 0xA0, 0x1);

return 0;

}

We have attempted to use i2c_write and it still seems to not write.

Our current workaround is to have a uenvcmd =i2c mw 0x58 0x1A0 0x1 1  in
the uEnv.txt to do the i2cwite.

Any suggestions are appreciated

Thanks

-Josh

--001a11c15b500b453a0521fd6175
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This is based of the beagleboard_X15 board.c<br></p>
<p dir=3D"ltr">The write to the PMIC to hold power on is limited to a 8 bit=
 address and the new PMIC has a longer address.<br></p>
<p dir=3D"ltr">int board_late_init(void)	</p>
<p dir=3D"ltr">{	</p>
<p dir=3D"ltr">	init_sata(0);</p>
<p dir=3D"ltr">	</p>
<p dir=3D"ltr">	/*	</p>
<p dir=3D"ltr">	=C2=A0* DEV_CTRL.DEV_ON =3D 1 please - else palmas switches=
 off in 8 seconds</p>
<p dir=3D"ltr">	=C2=A0* This is the POWERHOLD-in-Low behavior.	</p>
<p dir=3D"ltr">	=C2=A0*/	</p>
<p dir=3D"ltr">	palmas_i2c_write_u8(TPS65903X_CHIP_P1, 0xA0, 0x1);	</p>
<p dir=3D"ltr">	return 0;<br></p>
<p dir=3D"ltr">}<br></p>
<p dir=3D"ltr">We have attempted to use i2c_write and it still seems to not=
 write.<br></p>
<p dir=3D"ltr">Our current workaround is to have a uenvcmd =3Di2c mw 0x58 0=
x1A0 0x1 1 =C2=A0in the uEnv.txt to do the i2cwite.<br></p>
<p dir=3D"ltr">Any suggestions are appreciated<br></p>
<p dir=3D"ltr">Thanks<br></p>
<p dir=3D"ltr">-Josh</p>

--001a11c15b500b453a0521fd6175--
