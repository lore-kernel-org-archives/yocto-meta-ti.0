Return-Path: <exosyst@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C9E9E0027E
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 09:43:17 -0700 (PDT)
Received: by mail-pa0-f48.google.com with SMTP id kp12so6266966pab.35
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=N/E1h5XfpM3QKv3bAKYJzTs8rYhkMzXmSvAslF66w+g=;
	b=TneN4M5WPaTy7/UguWUQvUNO+LeRX4m4Ze6mZ7nMlXR42037umdUEbwdIOwdCAfGbC
	L3Y5EjnCK1DnmjdIkOeU01p/CXS9ncrgcK4OLofr2w0ntacjbuDaf8BlEk8tM/P2vja3
	jR2lWoIx/ipqxEA7uM4rHytBW4qrtMlH2z41GGnA0tVMAzoqv7LZYeuZmyed3uN87Ktp
	LfDEbVpaHCiHPF572cGXgpTcijnv8FtKoRQycVsQBykkMSQ1n+sPwBPfkJNmG+JlpdAV
	Erw6Uvy2UhpS0KOGMwmTyh8awKiWgtZb9Ay/AzS4xnHYgZAsgi784ELVI6dkYzk8LjpY
	xeYg==
Received: by 10.66.88.133 with SMTP id bg5mr34155740pab.80.1350319394980; Mon,
	15 Oct 2012 09:43:14 -0700 (PDT)
MIME-Version: 1.0
Sender: exosyst@gmail.com
Received: by 10.68.240.98 with HTTP; Mon, 15 Oct 2012 09:42:54 -0700 (PDT)
From: Nick G <exosyst+metaTI@gmail.com>
Date: Mon, 15 Oct 2012 17:42:54 +0100
X-Google-Sender-Auth: R2B_zTng7L0I_Vd6-XG6F6eyLpw
Message-ID: <CAN-pQATmpTTvzyG5Fhj26-KfaA3-dL3w3o2orT3kwokQ6xkn-Q@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Beaglebone USB Issues
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
X-List-Received-Date: Mon, 15 Oct 2012 16:43:17 -0000
Content-Type: multipart/alternative; boundary=f46d042dfd5ddf04ab04cc1bbb15

--f46d042dfd5ddf04ab04cc1bbb15
Content-Type: text/plain; charset=ISO-8859-1

Hey guys,

I'm using the Beaglebone with the 3.2 kernel ( Linux beaglebone 3.2.14 #1
Mon Oct 15 16:37:10 BST 2012 armv7l GNU/Linux ) and am having a weird issue.

I developed a driver for a USB gadget based on known working code, and
tested it on my desktop just fine but when I try it with the beaglebone I
sometimes get a USB disconnect:

root@beaglebone:/# /launcher_control -l -t 100 //sends a
Duration set to [ 2792.937500] Received command 0x4
100
[ 2793.043304] Received command 0x20
root@beaglebone:/# /launcher_control -f
[ 2848.961364] Received command 0x10
root@beaglebone:/# [ 2866.422424] usb 1-1: USB disconnect, device number 6
[ 2866.428436] udev not attached
[ 2866.711853] usb 1-1: new low-speed USB device number 7 using musb-hdrc
[ 2866.856842] usb 1-1: New USB device found, idVendor=2123, idProduct=1010
[ 2866.864013] usb 1-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 2866.871612] usb 1-1: Product: USB Missile Launcher
[ 2866.876708] usb 1-1: Manufacturer: Syntek
[ 2866.893524] generic-usb 0003:2123:1010.0006: claimed by neither input,
hiddev nor hidraw

This doesn't happen on the desktop, nor on an older board I have with a 3.4
kernel and wondered if there were any known regressions?

The code that matters is:

pr_debug("Sending usb_control_message()\n");
        retval = usb_control_msg(dev->udev,
                        usb_sndctrlpipe(dev->udev, 0),
                        LAUNCHER_CTRL_REQUEST,
                        LAUNCHER_CTRL_REQUEST_TYPE,
                        LAUNCHER_CTRL_VALUE,
                        LAUNCHER_CTRL_INDEX,
                        &buf,
                        sizeof(buf),
                        HZ*5);


        if (retval < 0) {
                pr_err("usb_control_msg failed (%d)", retval);
                goto unlock_exit;
        }

It returns fine on sending the code, but a subsequent request yields a -110
error return value and the device disconnects.

Any ideas would be appreciated as I am hoping to use the Beaglebone for a
training course.

Regards,
Nick

--f46d042dfd5ddf04ab04cc1bbb15
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hey guys,<br><br>I&#39;m using the Beaglebone with the 3.2 kernel ( Linux b=
eaglebone 3.2.14 #1 Mon Oct 15 16:37:10 BST 2012 armv7l GNU/Linux ) and am =
having a weird issue.<br><br>I developed a driver for a USB gadget based on=
 known working code, and tested it on my desktop just fine but when I try i=
t with the beaglebone I sometimes get a USB disconnect:<br>

<br>root@beaglebone:/# /launcher_control -l -t 100 //sends a <br>Duration s=
et to [ 2792.937500] Received command 0x4<br>100<br>[ 2793.043304] Received=
 command 0x20<br>root@beaglebone:/# /launcher_control -f<br>[ 2848.961364] =
Received command 0x10<br>

root@beaglebone:/# [ 2866.422424] usb 1-1: USB disconnect, device number 6<=
br>[ 2866.428436] udev not attached<br>[ 2866.711853] usb 1-1: new low-spee=
d USB device number 7 using musb-hdrc<br>[ 2866.856842] usb 1-1: New USB de=
vice found, idVendor=3D2123, idProduct=3D1010<br>

[ 2866.864013] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0<br>[ 2866.871612] usb 1-1: Product: USB Missile Launcher<br>[ 2=
866.876708] usb 1-1: Manufacturer: Syntek<br>[ 2866.893524] generic-usb 000=
3:2123:1010.0006: claimed by neither input, hiddev nor hidraw<br>

<br>This doesn&#39;t happen on the desktop, nor on an older board I have wi=
th a 3.4 kernel and wondered if there were any known regressions?<br><br>Th=
e code that matters is:<br><br>pr_debug(&quot;Sending usb_control_message()=
\n&quot;);<br>

=A0=A0=A0=A0=A0=A0=A0 retval =3D usb_control_msg(dev-&gt;udev,<br>=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 usb_sndctrlpip=
e(dev-&gt;udev, 0),<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 LAUNCHER_CTRL_REQUEST,<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LAUNCHER_CTRL_REQUEST_TYPE,<br>=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LAUNCHER=
_CTRL_VALUE,<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LAUNC=
HER_CTRL_INDEX,<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 &amp;buf,<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 sizeof(buf),<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HZ*5);=A0=A0=A0=A0=A0=A0=A0 <br><br><b=
r>=A0=A0=A0=A0=A0=A0=A0 if (retval &lt; 0) {<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 pr_err(&quot;usb_control_msg failed (%d)&quot;, retval);=
<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto unlock_exit;<br>=A0=A0=
=A0=A0=A0=A0=A0 }<br><br>It returns fine on sending the code, but a subsequ=
ent request yields a -110 error return value and the device disconnects.<br=
><br>Any ideas would be appreciated as I am hoping to use the Beaglebone fo=
r a training course.<br>

<br>Regards,<br>Nick<br><br>

--f46d042dfd5ddf04ab04cc1bbb15--
