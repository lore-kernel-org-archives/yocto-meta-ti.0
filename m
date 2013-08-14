Return-Path: <chgans@googlemail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9191E00747
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2013 01:21:34 -0700 (PDT)
Received: by mail-pd0-f179.google.com with SMTP id v10so5995352pde.24
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2013 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type;
	bh=37Bvy2g5xvI9y254oApiIsDjQzq/YRX6pHRclY8elFY=;
	b=IycmMEhwNGbsDkRkiDGydR/GBzlFmhMOi9LJ66E/0DhvwKszDU6iHYcXOHv4wNrR/y
	JPqqUUq4hev7qMcQU14cXgPbtbmTVJc5Kp+8d7+zDNQm3ci1WH8WktP/bIIWkYvnKP5P
	fXPpJtI24BONFGzyd/S8EtNERY/M5VRrKafDJkuIQw6LXynxSVEAhW+5R5Qar5TToezT
	h9+Rr0XDAOvsRxR6q3WjLQziIgg5Q68QwvcpHy8z0P5E/Fr003e2B4Ne2YLG6HVcj02N
	H+ES25KzCmYQVSCaX903BkWoWLDWgk27X0LmpI6AMJbroOSu9YaB0znrLaJ4kMnrpUQj
	uS2Q==
X-Received: by 10.66.146.66 with SMTP id ta2mr8745749pab.11.1376468494771;
	Wed, 14 Aug 2013 01:21:34 -0700 (PDT)
Received: from linux-z8sp.site ([121.99.34.39])
	by mx.google.com with ESMTPSA id
	qh10sm48713768pbb.33.2013.08.14.01.21.32
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 01:21:33 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <520BE6D8.1010901@gna.org>
Date: Thu, 15 Aug 2013 08:21:44 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CALEed8ZSPE+kmVK1bJbVZRCZ1TEPE8xLuxF38jqs+geFcz=8bg@mail.gmail.com>
In-Reply-To: <CALEed8ZSPE+kmVK1bJbVZRCZ1TEPE8xLuxF38jqs+geFcz=8bg@mail.gmail.com>
Subject: Re: Trouble booting BeagleBone Black
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
X-List-Received-Date: Wed, 14 Aug 2013 08:21:35 -0000
Content-Type: multipart/alternative;
	boundary="------------020007000800010900050602"

--------------020007000800010900050602
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2013 07:03 AM, Bernard Mentink wrote:
> Hi All,
>
> I have just used Yocto with the meta-ti layer to build the minimal 
> image, placed all the files on an SD card and tried to boot ..
> It gets a couple of seconds into the kernel and hangs on mmc pin 
> setting, copy of the boot --> http://pastebin.com/0asaJ9tf
>
> Question: I built for MACHINE=beaglebone but I don't know if that is 
> for the while or black targets, or if there is a difference.
> I suspect the issue is with the device-tree file .. the tool built a 
> file called  uImage-am335x-bone.dtb, but when the kernel tried to 
> boot, it wanted a file called am335x-boneblack.dtb, so I just re-named 
> the produced file to that and I got the above boot sequence ..

Hi Bernie,

I did the same kind of build recently (10/15days ago, can't remember), 
and it worked like a charm, the same build (and images) can be used on 
all am335x boards (EVM, BB black/white, etc, but I tested only with the 
EVM and the BB black).

Basically, the bootloader detect the board it is running on and select 
the right DTB for you, cute! ;)
This imply that all DTB files have been installed on /boot of course, 
but you only need one MLO, u-boot and linux image.

Didn't try again since then.

My 2 cents, Chris.

>
> Maybe that is the wrong thing to do? Is there a way to get the build 
> to produce the am335x-boneblack.dtb file?
>
> Thanks,
> Bernie
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--------------020007000800010900050602
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/12/2013 07:03 AM, Bernard Mentink
      wrote:<br>
    </div>
    <blockquote
cite="mid:CALEed8ZSPE+kmVK1bJbVZRCZ1TEPE8xLuxF38jqs+geFcz=8bg@mail.gmail.com"
      type="cite">
      <div dir="ltr">Hi All,
        <div><br>
        </div>
        <div style="">I have just used Yocto with the meta-ti layer to
          build the minimal image, placed all the files on an SD card
          and tried to boot ..</div>
        <div style="">It gets a couple of seconds into the kernel and
          hangs on mmc pin setting, copy of the boot --&gt;&nbsp;<a
            moz-do-not-send="true" href="http://pastebin.com/0asaJ9tf">http://pastebin.com/0asaJ9tf</a></div>
        <div style=""><br>
        </div>
        <div style="">Question: I built for MACHINE=beaglebone but I
          don't know if that is for the while or black targets, or if
          there is a difference.</div>
        <div style="">I suspect the issue is with the device-tree file
          .. the tool built a file called &nbsp;uImage-am335x-bone.dtb, but
          when the kernel tried to boot, it wanted a file
          called&nbsp;am335x-boneblack.dtb, so I just re-named the produced
          file to that and I got the above boot sequence ..</div>
      </div>
    </blockquote>
    <br>
    Hi Bernie,<br>
    <br>
    I did the same kind of build recently (10/15days ago, can't
    remember), and it worked like a charm, the same build (and images)
    can be used on all am335x boards (EVM, BB black/white, etc, but I
    tested only with the EVM and the BB black).<br>
    <br>
    Basically, the bootloader detect the board it is running on and
    select the right DTB for you, cute! ;)<br>
    This imply that all DTB files have been installed on /boot of
    course, but you only need one MLO, u-boot and linux image.<br>
    <br>
    Didn't try again since then.<br>
    <br>
    My 2 cents, Chris.<br>
    <br>
    <blockquote
cite="mid:CALEed8ZSPE+kmVK1bJbVZRCZ1TEPE8xLuxF38jqs+geFcz=8bg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div style=""><br>
        </div>
        <div style="">Maybe that is the wrong thing to do? Is there a
          way to get the build to produce the&nbsp;am335x-boneblack.dtb file?</div>
        <div style=""><br>
        </div>
        <div style="">Thanks,</div>
        <div style="">Bernie</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-ti mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020007000800010900050602--
