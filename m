Return-Path: <V.Vogelhuber@DigitalEndoscopy.de>
Received: from SRV-MSX01.digitendos.local
	(host-80-81-19-29.customer.m-online.net [80.81.19.29])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5988E01767
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 03:55:01 -0700 (PDT)
Received: from [192.168.10.111] (192.168.10.111) by SRV-MSX01.digitendos.local
	(192.168.10.14) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 25 Oct 2013 12:54:58 +0200
Message-ID: <526A4E00.2030505@digitalendoscopy.de>
Date: Fri, 25 Oct 2013 12:54:56 +0200
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
CC: <meta-ti@yoctoproject.org>
References: <526A4413.2090801@digitalendoscopy.de>
	<20131025103033.GA13772@edge>
In-Reply-To: <20131025103033.GA13772@edge>
X-Originating-IP: [192.168.10.111]
X-TM-AS-Product-Ver: SMEX-10.1.0.2244-7.000.1014-20242.004
X-TM-AS-Result: No--28.073800-0.000000-31
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
Subject: Re: State of dylan branch in meta-ti
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
X-List-Received-Date: Fri, 25 Oct 2013 10:55:02 -0000
Content-Type: multipart/alternative;
	boundary="------------040402020400050801080905"

--------------040402020400050801080905
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 25.10.2013 12:30, Denys Dmytriyenko wrote:
> On Fri, Oct 25, 2013 at 12:12:35PM +0200, Volker Vogelhuber wrote:
>> I just checked out the dylan branch of the yocto core and the
>> meta-ti repository.
>> It seems like the state of the meta-ti branch is not yet consistent
>> to work out of the box.
>>
>> I currently had to remove the update-modules part from the ti
>> recipes and had to add
>> RPROVIDES_${PN} += "kernel-module-dsplinkk" to the ti-dsplink.inc
>>
>> Did I miss something or the dylan branch just not yet in a consistent state?
> It's in great shape - better than ever! What you don't mention is what
> platform you are using. You do mention dsplink though, but that is long since
> unsupported. As a matter of fact, most of the old DSP related recipes are not
> supported [1]. The new replacements are not ready yet. Other than that, it
> provides great BSP support for platforms listed in the conf/ directory.
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=dylan
Thanks for the link, actually I did not read that notice yet indeed.
I'm currently using a TAO-3530 board from technexion.
We used to work with the denzil branch for some time, but after updating 
to ubuntu
13.10 there were a lot of errors that I tried to fix with the dylan 
branch. And indeed after
patching some small problems (next to the patches for the meta-ti 
branch), it does create
a rootfs image at least, but have to flash it and test if it has some 
additional problems.

I only wonder why the problem with the kernel-module- package name does 
only occure with the
dsplink and not with the e.g. libgles modules as they seem to provide 
wrong package names as well.

Regards,
     Volker
-- 

*Volker Vogelhuber*| Softwareentwickler

*PENTAX**MEDICA**L
*/Excellence in Focus//^TM /

Tel: +49(0)821-650566-18
v.vogelhuber@DigitalEndoscopy.de <mailto:v.vogelhuber@DigitalEndoscopy.de>

Hoya Corporation - Pentax Medical Division
*Digital**Endoscopy GmbH*
Paul-Lenz-Str. 5
86316 Friedberg - Germany
pentaxmedical.com
Handelsregister HRB 27226
Amtsgericht Augsburg
Geschäftsführer: Michael Drexel, Marc Henzler
Sitz: Paul-Lenz-Str. 5, 86316 Friedberg, Germany

_____________________________________

Diese E-Mail enthält vertrauliche und/oder rechtlich geschützte 
Informationen. Wenn Sie nicht der richtige Adressat sind oder diese 
E-Mail irrtümlich erhalten haben, informieren Sie bitte sofort den 
Absender und vernichten Sie diese Mail. Das unerlaubte Kopieren sowie 
die unbefugte Weitergabe dieser Mail ist nicht gestattet.
This e-mail may contain confidential and/or privileged information. If 
you are not the intended recipient (or have received this e-mail in 
error) please notify the sender immediately and destroy this e-mail. Any 
unauthorized copying, disclosure or distribution of the material in this 
e-mail is strictly forbidden.


--------------040402020400050801080905
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 25.10.2013 12:30, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote cite="mid:20131025103033.GA13772@edge" type="cite">
      <pre wrap="">On Fri, Oct 25, 2013 at 12:12:35PM +0200, Volker Vogelhuber wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">I just checked out the dylan branch of the yocto core and the
meta-ti repository.
It seems like the state of the meta-ti branch is not yet consistent
to work out of the box.

I currently had to remove the update-modules part from the ti
recipes and had to add
RPROVIDES_${PN} += "kernel-module-dsplinkk" to the ti-dsplink.inc

Did I miss something or the dylan branch just not yet in a consistent state?
</pre>
      </blockquote>
      <pre wrap="">
It's in great shape - better than ever! What you don't mention is what 
platform you are using. You do mention dsplink though, but that is long since 
unsupported. As a matter of fact, most of the old DSP related recipes are not 
supported [1]. The new replacements are not ready yet. Other than that, it 
provides great BSP support for platforms listed in the conf/ directory.

[1] <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=dylan">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=dylan</a>
</pre>
    </blockquote>
    Thanks for the link, actually I did not read that notice yet indeed.<br>
    I'm currently using a TAO-3530 board from technexion. <br>
    We used to work with the denzil branch for some time, but after
    updating to ubuntu <br>
    13.10 there were a lot of errors that I tried to fix with the dylan
    branch. And indeed after<br>
    patching some small problems (next to the patches for the meta-ti
    branch), it does create<br>
    a rootfs image at least, but have to flash it and test if it has
    some additional problems.<br>
    <br>
    I only wonder why the problem with the kernel-module- package name
    does only occure with the <br>
    dsplink and not with the e.g. libgles modules as they seem to
    provide wrong package names as well.<br>
    <br>
    Regards,<br>
    &nbsp;&nbsp;&nbsp; Volker<br>
    <div class="moz-signature">-- <br>
      <!-- <head> -->
      <!--   <meta content="text/html; " http-equiv="content-type"> -->
      <!--   <title></title> -->
      <!-- </head> -->
      <p class="MsoNormal"><b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
            lang="DE">Volker Vogelhuber</span></b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"> | Softwareentwickler</span></p>
      <p class="MsoNormal"><b><span
            style="font-size:12.0pt;font-family:'serif';color:#DA291C"
            lang="DE">PENTAX</span></b><b><span
            style="font-size:12.0pt;font-family:'serif';color:#53565A"
            lang="DE"> MEDICA</span></b><b><span
            style="font-family:'serif';color:#53565A;font-size:12.0pt;">L<br>
          </span></b><i><span
            style="font-size:12.0pt;font-family:'serif';color:#53565A">Excellence

            in Focus</span></i><i><sup><span
              style="font-size:8.0pt;font-family:'serif';color:#53565A">TM</span></sup></i><span
style="font-size:7.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"
          lang="EN-GB"><o:p></o:p></span></p>
      <p class="MsoNormal"><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:red;mso-fareast-language:DE"
          lang="EN-GB">Tel:&nbsp; </span><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB">+49(0)821-650566-</span><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"
          lang="EN-GB">18</span><span
style="font-size:12.0pt;font-family:'serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB"><o:p></o:p></span><br>
        <span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB"><a href="mailto:v.vogelhuber@DigitalEndoscopy.de"><span
              style="color:#404040;text-decoration:none" lang="EN-US">v.vogelhuber@DigitalEndoscopy.de</span></a><o:p></o:p></span></p>
      <p class="MsoNormal"><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB">Hoya Corporation - Pentax Medical Division</span><br>
        <b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
            lang="EN-GB">Digital</span></b><b><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
            lang="EN-GB"> Endoscopy GmbH<o:p></o:p></span></b><span
style="font-size:9.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB"><br>
          Paul-Lenz-Str. 5<o:p></o:p><br>
          86316 Friedberg - Germany<o:p></o:p></span><span
          style="font-family:'serif';color:#E70600;mso-fareast-language:JA"><br>
          pentax</span><span
          style="font-family:'serif';color:#0D2531;mso-fareast-language:JA">medical.com</span><span
style="font-size:5.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"><o:p></o:p></span><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"><br>
          Handelsregister HRB 27226<o:p></o:p><br>
          Amtsgericht Augsburg<o:p></o:p><br>
          Gesch&auml;ftsf&uuml;hrer: Michael Drexel, Marc Henzler<o:p></o:p><br>
          Sitz: Paul-Lenz-Str. 5, 86316 Friedberg, Germany</span><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#1F497D;mso-fareast-language:DE"
          lang="DE"><o:p></o:p></span> </p>
      <p class="MsoNormal"><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"><o:p>&nbsp;</o:p></span><span
style="font-size:10.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE">_____________________________________<o:p></o:p></span><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="DE"><o:p>&nbsp;</o:p></span> </p>
      <p class="MsoNormal"><span
style="font-size:8.0pt;font-family:'Arial','sans-serif';color:#404040;mso-fareast-language:DE"
          lang="EN-GB">Diese E-Mail enth&auml;lt vertrauliche und/oder
          rechtlich gesch&uuml;tzte Informationen. Wenn Sie nicht der
          richtige Adressat sind oder diese E-Mail irrt&uuml;mlich erhalten
          haben, informieren Sie bitte sofort den Absender und
          vernichten Sie diese Mail. Das unerlaubte Kopieren sowie die
          unbefugte Weitergabe dieser Mail ist nicht gestattet.<br>
          This e-mail may contain confidential and/or privileged
          information. If you are not the intended recipient (or have
          received this e-mail in error) please notify the sender
          immediately and destroy this e-mail. Any unauthorized copying,
          disclosure or distribution of the material in this e-mail is
          strictly forbidden.</span><span
          style="color:#404040;mso-fareast-language:DE" lang="EN-GB"><o:p></o:p></span></p>
      <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
    </div>
  </body>
</html>

--------------040402020400050801080905--
