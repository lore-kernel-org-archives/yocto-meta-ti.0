Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85C27E0059A
	for <meta-ti@yoctoproject.org>; Sat,  5 Oct 2013 09:46:31 -0700 (PDT)
Received: by mail-ee0-f46.google.com with SMTP id c13so2370961eek.19
	for <meta-ti@yoctoproject.org>; Sat, 05 Oct 2013 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XuhGBAWILAOnaRqAoX7ZECi0FH3wbnoHfh1plP6F/cs=;
	b=WbCuDQhcwLFvkYkFEQnl8FN3rGR9DIl7JTzQvjDsJsbjHltN+7alX9BBtz6ralokN1
	4GDbBZJky0Lim1wZ4TKWIpGNuARkpWXUONfIdLVJAZGLSCFwV8ILkY+7BtFC/wMysUFp
	HDR1SKWpqe2hssg03u6UkK6u1AKIIkQ+3Jt8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=XuhGBAWILAOnaRqAoX7ZECi0FH3wbnoHfh1plP6F/cs=;
	b=BC+4lHHkv6MQN0PkLHe0lsNj/TjsJODTpPCLe7Fv+r04RnCqrMsZbdg578m7iY4kTi
	mOAi2rDZhoruEMOBgXJ9i0sg1/rCmj8nkN6BZ8or+Ot/gcZRQ7F0guLZXUCSnz9fus52
	YSZr5P5jwqJOuLOWgJocsNh713C2XlLVAC6e9TUa1Tv3kwOGHM4hkx4Trm0uVmDdIsbZ
	SiWEQzSooWM3iy/Q7t2yN43rXCaJw/pMszJn+DJbXqO4DvtEDfQpns6B+x4TiqoQVFyV
	xPZu4mG+AthBIQAqwGHtnZVcvL7y7m0HbLFqt6ggxVlIZ52K/hXY5pTAaEDPdBEZE9ws
	MKbg==
X-Gm-Message-State: ALoCoQl9z0Txjf9Q1ef/7ig46KCHthaDpX228vE3a9TDYc5nVPdOaS6DZJHvfNqEwOjyeiFEEpyD
MIME-Version: 1.0
X-Received: by 10.15.98.9 with SMTP id bi9mr182348eeb.67.1380991589612; Sat,
	05 Oct 2013 09:46:29 -0700 (PDT)
Received: by 10.223.131.3 with HTTP; Sat, 5 Oct 2013 09:46:29 -0700 (PDT)
In-Reply-To: <CA+gsK-rqwXrV1WjWx0pttqpxMkkM29cBwYMHvEaXdDDVcuW0tw@mail.gmail.com>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
	<CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
	<20131004182321.GA3672@edge>
	<CA+gsK-ofzwiKXqVCQ-=_kcvZJu+aaWqa07-DgVYTh91VB70OvQ@mail.gmail.com>
	<20131004215047.GD3672@edge>
	<CA+gsK-rqwXrV1WjWx0pttqpxMkkM29cBwYMHvEaXdDDVcuW0tw@mail.gmail.com>
Date: Sat, 5 Oct 2013 09:46:29 -0700
Message-ID: <CA+gsK-o7xrHme-VAZvXooFEBid=hcc25dmwhc+2GcreJ0D=xVg@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Sat, 05 Oct 2013 16:46:34 -0000
Content-Type: multipart/alternative; boundary=089e01681470233bee04e80129eb

--089e01681470233bee04e80129eb
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

I guess I have to follow up on this. Everything builds now and with
core-image-base the kernel image is installed into /boot. The fdt is not
however. I used the Beaglebone in this case because it's a known board to
me and I have been able to boot it successfully with my own Beaglebone BSP
many time.

This is what I did on a preformatted SD card with partition 0 with FAT and
partition 1 with ext4 with the images built using the meta-ti layer:

   1. sudo cp MLO-beaglebone /run/media/rudi/BEAGBOOT/MLO
   2. sudo cp u-boot-beaglebone.img /run/media/rudi/BEAGBOOT/u-boot.img
   3. sudo tar x -C /run/media/rudi/beagroot1/ -f
   core-image-base-beaglebone.tar.gz
   4. sudo tar x -C /run/media/rudi/beagroot1/ -f
   modules--3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256-beaglebone-20131005020051.tgz
   5. cp uImage-am335x-bone.dtb
   /run/media/rudi/beagroot1/boot/am335x-bone.dtb

For step 5 one of course has to know that the u-boot environment expects an
fdt with the name am335x-bone.dtb in /boot.

The u-boot bootcmd is set to

bootcmd=run findfdt; run mmcboot;setenv mmcdev 1; setenv bootpart 1:2; run
mmcboot;run nandboot;

findfdt finds and sets the fdtfile variable correctly to am335x-bone.dtb.

mmcboot eventually runs mmcloados which is set to:

mmcloados=run mmcargs; if test ${boot_fdt} = yes || test ${boot_fdt} = try;
then if run loadfdt; then bootm ${loadaddr} - ${fdtaddr}; else if test
${boot_fdt} = try; then bootm; else echo WARN: Cannot load the DT; fi; fi;
else bootm; fi;

That's the default. It loads the fdt correctly but it never loads the
kernel image. There is no command that executes loaduimage which is set to:

loaduimage=load mmc ${bootpart} ${loadaddr} ${bootdir}/${bootfile}


Now, I executed all these steps manually and loaded the fdt and the kernel
image, etc and eventually ran bootm. u-boots loads and decompresses the
kernel and then it stops at "Starting kernel..." Probably a device tree
issue.


There are two issues:

   1. u-boot environment does not load the kernel image. I can get around
   that.
   2. Device tree does not seem to match the kernel image but that's only a
   guess at this point.

Thanks,
Rudi

--089e01681470233bee04e80129eb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Denys,</div><div><br></div>I guess I have to follo=
w up on this. Everything builds now and with core-image-base the kernel ima=
ge is installed into /boot. The fdt is not however. I used the Beaglebone i=
n this case because it&#39;s a known board to me and I have been able to bo=
ot it successfully with my own Beaglebone BSP many time.<div>
<br></div><div>This is what I did on a preformatted SD card with partition =
0 with FAT and partition 1 with ext4 with the images built using the meta-t=
i layer:<div><ol><li>sudo cp MLO-beaglebone /run/media/rudi/BEAGBOOT/MLO<br=
>
</li><li>sudo cp u-boot-beaglebone.img /run/media/rudi/BEAGBOOT/u-boot.img<=
br></li><li>sudo tar x -C /run/media/rudi/beagroot1/ -f core-image-base-bea=
glebone.tar.gz<br></li><li>sudo tar x -C /run/media/rudi/beagroot1/ -f modu=
les--3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c57425=
6-beaglebone-20131005020051.tgz<br>
</li><li>cp uImage-am335x-bone.dtb /run/media/rudi/beagroot1/boot/am335x-bo=
ne.dtb<br></li></ol><div>For step 5 one of course has to know that the u-bo=
ot environment expects an fdt with the name am335x-bone.dtb in /boot.</div>
</div></div><div><br></div><div>The u-boot bootcmd is set to</div><div><br>=
</div><div>bootcmd=3Drun findfdt; run mmcboot;setenv mmcdev 1; setenv bootp=
art 1:2; run mmcboot;run nandboot;</div><div><br></div><div>findfdt finds a=
nd sets the fdtfile variable correctly to am335x-bone.dtb.</div>
<div><br></div><div>mmcboot eventually runs mmcloados which is set to:</div=
><div><br></div><div><div>mmcloados=3Drun mmcargs; if test ${boot_fdt} =3D =
yes || test ${boot_fdt} =3D try; then if run loadfdt; then bootm ${loadaddr=
} - ${fdtaddr}; else if test ${boot_fdt} =3D try; then bootm; else echo WAR=
N: Cannot load the DT; fi; fi; else bootm; fi;</div>
</div><div><br></div><div>That&#39;s the default. It loads the fdt correctl=
y but it never loads the kernel image. There is no command that executes lo=
aduimage which is set to:</div><div><br></div><div>loaduimage=3Dload mmc ${=
bootpart} ${loadaddr} ${bootdir}/${bootfile}<br>
</div><div><br></div><div><br></div><div>Now, I executed all these steps ma=
nually and loaded the fdt and the kernel image, etc and eventually ran boot=
m. u-boots loads and decompresses the kernel and then it stops at &quot;Sta=
rting kernel...&quot; Probably a device tree issue.</div>
<div><br></div><div><br></div><div>There are two issues:</div><div><ol><li>=
u-boot environment does not load the kernel image. I can get around that.</=
li><li>Device tree does not seem to match the kernel image but that&#39;s o=
nly a guess at this point.</li>
</ol><div>Thanks,</div></div><div>Rudi</div><div><br></div><div><br></div><=
/div>

--089e01681470233bee04e80129eb--
